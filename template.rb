require "fileutils"
require "shellwords"

# Copied from: https://github.com/mattbrictson/rails-template
# Add this template directory to source_paths so that Thor actions like
# copy_file and template resolve against our source files. If this file was
# invoked remotely via HTTP, that means the files are not present locally.
# In that case, use `git clone` to download them to a local temporary dir.
def add_template_repository_to_source_path
  if __FILE__ =~ %r{\Ahttps?://}
    require "tmpdir"
    source_paths.unshift(tempdir = Dir.mktmpdir("jumpstart-"))
    at_exit { FileUtils.remove_entry(tempdir) }
    git clone: [
      "--quiet",
      "https://github.com/ElMassimo/jumpstart-vite.git",
      tempdir
    ].map(&:shellescape).join(" ")

    if (branch = __FILE__[%r{jumpstart-vite/(.+)/template.rb}, 1])
      Dir.chdir(tempdir) { git checkout: branch }
    end
  else
    source_paths.unshift(File.dirname(__FILE__))
  end
end

def rails_version
  @rails_version ||= Gem::Version.new(Rails::VERSION::STRING)
end

def rails_5?
  Gem::Requirement.new(">= 5.2.0", "< 6.0.0.beta1").satisfied_by? rails_version
end

def rails_6?
  Gem::Requirement.new(">= 6.0.0.beta1", "< 7").satisfied_by? rails_version
end

def add_gems
  gem 'madmin', github: 'excid3/madmin'
  gem 'bootstrap', '~> 4.5'
  gem 'devise', '~> 4.7', '>= 4.7.1'
  gem 'devise-bootstrapped', github: 'excid3/devise-bootstrapped', branch: 'bootstrap4'
  gem 'devise_masquerade', '~> 1.2'
  gem 'friendly_id', '~> 5.3'
  gem 'image_processing'
  gem 'mini_magick', '~> 4.10', '>= 4.10.1'
  gem 'name_of_person', '~> 1.1'
  gem 'noticed', '~> 1.2'
  gem 'omniauth-facebook', '~> 6.0'
  gem 'omniauth-github', '~> 1.4'
  gem 'omniauth-twitter', '~> 1.4'
  gem 'pundit', '~> 2.1'
  # Hotwire installs Redis
  #gem 'redis', '~> 4.2', '>= 4.2.2'
  gem 'sidekiq', '~> 6.0', '>= 6.0.3'
  gem 'sitemap_generator', '~> 6.1', '>= 6.1.2'
  gem 'whenever', require: false
  gem 'hotwire-rails'
  gem 'vite_rails'
  gem 'js_from_routes', group: :development

  # Remove sass-rails
  gsub_file "Gemfile", /^gem\s+["']sass-rails["'].*$/,''

  if rails_5?
    gsub_file "Gemfile", /gem 'sqlite3'/, "gem 'sqlite3', '~> 1.3.0'"
  else
    # Remove Webpacker
    gsub_file "Gemfile", /^gem\s+["']webpacker["'].*$/,''
    def self.webpack_install?
      false
    end
  end
end

def set_application_name
  # Add Application Name to Config
  if rails_5?
    environment "config.application_name = Rails.application.class.parent_name"
  else
    environment "config.application_name = Rails.application.class.module_parent_name"
  end

  # Announce the user where they can change the application name in the future.
  puts "You can change application name inside: ./config/application.rb"
end

def add_users
  # Install Devise
  generate "devise:install"

  # Configure Devise
  environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }",
              env: 'development'
  route "root to: 'home#index'"

  # Devise notices are installed via Bootstrap
  generate "devise:views:bootstrapped"

  # Create Devise User
  generate :devise, "User",
           "first_name",
           "last_name",
           "announcements_last_read_at:datetime",
           "admin:boolean"

  # Set admin default to false
  in_root do
    migration = Dir.glob("db/migrate/*").max_by{ |f| File.mtime(f) }
    gsub_file migration, /:admin/, ":admin, default: false"
  end

  if Gem::Requirement.new("> 5.2").satisfied_by? rails_version
    gsub_file "config/initializers/devise.rb",
      /  # config.secret_key = .+/,
      "  config.secret_key = Rails.application.credentials.secret_key_base"
  end

  # Add Devise masqueradable to users
  inject_into_file("app/models/user.rb", "omniauthable, :masqueradable, :", after: "devise :")
end

def add_authorization
  generate 'pundit:install'
end

def add_vite
  run 'bundle exec vite install'
  inject_into_file('vite.config.ts', "import FullReload from 'vite-plugin-full-reload'\n", after: %(from 'vite'\n))
  inject_into_file('vite.config.ts', "import StimulusHMR from 'vite-plugin-stimulus-hmr'\n", after: %(from 'vite'\n))
  inject_into_file('vite.config.ts', "\n    FullReload(['config/routes.rb', 'app/views/**/*']),", after: 'plugins: [')
  inject_into_file('vite.config.ts', "\n    StimulusHMR(),", after: 'plugins: [')
end

def add_javascript
  run "yarn add expose-loader jquery popper.js bootstrap data-confirm-modal local-time @hotwired/turbo-rails trix @rails/actiontext sass @popperjs/core font-awesome stimulus stimulus-vite-helpers vite-plugin-stimulus-hmr vite-plugin-full-reload typescript @js-from-routes/client"
  if rails_5?
    run "yarn add @rails/actioncable@pre @rails/actiontext@pre @rails/activestorage@pre @rails/ujs@pre"
  end
end

def add_hotwire
  rails_command "hotwire:install"
end

def copy_templates
  remove_file "app/assets/stylesheets/application.css"
  remove_file "app/javascript/packs/application.js" # Webpack

  copy_file "Procfile"
  copy_file "Procfile.dev"
  copy_file "tsconfig.json"
  copy_file ".foreman"

  directory "app", force: true
  directory "config", force: true
  directory "lib", force: true

  route "get '/terms', to: 'home#terms'"
  route "get '/privacy', to: 'home#privacy'"
end

def add_sidekiq
  environment "config.active_job.queue_adapter = :sidekiq"

  insert_into_file "config/routes.rb",
    "require 'sidekiq/web'\n\n",
    before: "Rails.application.routes.draw do"

  content = <<-RUBY
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end
  RUBY
  insert_into_file "config/routes.rb", "#{content}\n\n", after: "Rails.application.routes.draw do\n"
end

def add_announcements
  generate "model Announcement published_at:datetime announcement_type name description:text"
  route "resources :announcements, only: [:index], export: true"
end

def add_notifications
  generate "noticed:model"
  route "resources :notifications, only: [:index], export: true"
end

def add_administrate
  generate "administrate:install"

  append_to_file "app/assets/config/manifest.js" do
    "//= link administrate/application.css\n//= link administrate/application.js"
  end

  gsub_file "app/dashboards/announcement_dashboard.rb",
    /announcement_type: Field::String/,
    "announcement_type: Field::Select.with_options(collection: Announcement::TYPES)"

  gsub_file "app/dashboards/user_dashboard.rb",
    /email: Field::String/,
    "email: Field::String,\n    password: Field::String.with_options(searchable: false)"

  gsub_file "app/dashboards/user_dashboard.rb",
    /FORM_ATTRIBUTES = \[/,
    "FORM_ATTRIBUTES = [\n    :password,"

  gsub_file "app/controllers/admin/application_controller.rb",
    /# TODO Add authentication logic here\./,
    "redirect_to '/', alert: 'Not authorized.' unless user_signed_in? && current_user.admin?"

  environment do <<-RUBY
    # Expose our application's helpers to Administrate
    config.to_prepare do
      Administrate::ApplicationController.helper #{@app_name.camelize}::Application.helpers
    end
  RUBY
  end
end

def add_multiple_authentication
    insert_into_file "config/routes.rb",
    ', controllers: { omniauth_callbacks: "users/omniauth_callbacks" }',
    after: "  devise_for :users"

    generate "model Service user:references provider uid access_token access_token_secret refresh_token expires_at:datetime auth:text"

    template = """
    env_creds = Rails.application.credentials[Rails.env.to_sym] || {}
    %i{ facebook twitter github }.each do |provider|
      if options = env_creds[provider]
        config.omniauth provider, options[:app_id], options[:app_secret], options.fetch(:options, {})
      end
    end
    """.strip

    insert_into_file "config/initializers/devise.rb", "  " + template + "\n\n",
          before: "  # ==> Warden configuration"
end

def add_whenever
  run "wheneverize ."
end

def add_friendly_id
  generate "friendly_id"

  insert_into_file(
    Dir["db/migrate/**/*friendly_id_slugs.rb"].first,
    "[5.2]",
    after: "ActiveRecord::Migration"
  )
end

def stop_spring
  run "spring stop"
end

def add_sitemap
  rails_command "sitemap:install"
end

# Main setup
add_template_repository_to_source_path

add_gems

after_bundle do
  set_application_name
  stop_spring
  add_users
  add_authorization
  add_javascript
  add_announcements
  add_notifications
  add_multiple_authentication
  add_sidekiq
  add_friendly_id
  add_hotwire

  copy_templates
  add_vite
  add_whenever
  add_sitemap

  rails_command "active_storage:install"
  rails_command "js_from_routes:generate"

  # Commit everything to git
  unless ENV["SKIP_GIT"]
    git :init
    git add: "."
    # git commit will fail if user.email is not configured
    begin
      git commit: %( -m 'Initial commit' )
    rescue StandardError => e
      puts e.message
    end
  end

  say
  say "Jumpstart app successfully created!", :blue
  say
  say "To get started with your new app:", :green
  say "  cd #{app_name}"
  say
  say "  # Update config/database.yml with your database credentials"
  say
  say "  rails db:create && rails db:migrate"
  say "  rails g madmin:install # Generate admin dashboards"
  say "  gem install foreman"
  say "  foreman start # Run Rails, sidekiq, and vite"
end
