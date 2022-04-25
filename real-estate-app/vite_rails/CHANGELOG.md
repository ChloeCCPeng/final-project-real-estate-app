## [3.0.8](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@3.0.7...vite_rails@3.0.8) (2022-04-14)


### Bug Fixes

* prevent error when using a proc in asset_host (close [#202](https://github.com/ElMassimo/vite_ruby/issues/202)) ([#203](https://github.com/ElMassimo/vite_ruby/issues/203)) ([cb23a81](https://github.com/ElMassimo/vite_ruby/commit/cb23a81037651ac01d993935f68cc526ec2c844d))



## [3.0.7](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@3.0.6...vite_rails@3.0.7) (2022-03-17)


### Bug Fixes

* load rails environment before rake tasks (close [#193](https://github.com/ElMassimo/vite_ruby/issues/193)) ([72afbc7](https://github.com/ElMassimo/vite_ruby/commit/72afbc7ab5ca33833e9330954499bcf460fd7669))



## [3.0.6](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@3.0.5...vite_rails@3.0.6) (2022-02-04)


### Bug Fixes

* don't add crossorigin to included stylesheet tags (close [#189](https://github.com/ElMassimo/vite_ruby/issues/189)) ([#190](https://github.com/ElMassimo/vite_ruby/issues/190)) ([575c731](https://github.com/ElMassimo/vite_ruby/commit/575c73192fb485e8844f67b821c856d1a09db8f5))



## [3.0.5](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@3.0.4...vite_rails@3.0.5) (2022-01-18)


### Bug Fixes

* update example setup from turbolinks to @hotwired/turbo ([e1750bf](https://github.com/ElMassimo/vite_ruby/commit/e1750bfb4b22a9a73a2b86950fb203d3e489ced6))



## [3.0.4](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@3.0.3...vite_rails@3.0.4) (2022-01-02)


### Features

* add style-src to suggestion Content Security Policy changes ([#169](https://github.com/ElMassimo/vite_ruby/issues/169)) ([ec7f4f7](https://github.com/ElMassimo/vite_ruby/commit/ec7f4f7a030a852115b38748dd3cdb22ec3b7e47))



## [3.0.3](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@3.0.2...vite_rails@3.0.3) (2021-12-22)



## [3.0.2](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@3.0.1...vite_rails@3.0.2) (2021-12-12)


### Bug Fixes

* add variable declaration to import.meta.globEager (close [#154](https://github.com/ElMassimo/vite_ruby/issues/154)) ([#155](https://github.com/ElMassimo/vite_ruby/issues/155)) ([9ada2e8](https://github.com/ElMassimo/vite_ruby/commit/9ada2e87c68899e8e1bad368c875f8214036abcc))
* comment back glob import ([943e7f1](https://github.com/ElMassimo/vite_ruby/commit/943e7f1ca23a8abdee09c1495dc9e96494bc6202))



## [3.0.1](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@3.0.0...vite_rails@3.0.1) (2021-10-29)


### Features

* enable hmr when running tests in development with vite dev server ([e253bba](https://github.com/ElMassimo/vite_ruby/commit/e253bba26d164aabc7a9526df504c207ad2cf6f9))



# [3.0.0](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@2.0.13...vite_rails@3.0.0) (2021-08-16)

See https://github.com/ElMassimo/vite_ruby/pull/116 for features and breaking changes.

## [2.0.13](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@2.0.12...vite_rails@2.0.13) (2021-07-27)


### Features

* Set config.javascript_path so that zeitwerk ignores frontend files ([bab359f](https://github.com/ElMassimo/vite_ruby/commit/bab359f66a5942904e91e2a1a51b440072ba44af))



## [2.0.12](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@2.0.11...vite_rails@2.0.12) (2021-05-24)


### Bug Fixes

* Fix typo in comment in example entrypoint in Rails ([78b3104](https://github.com/ElMassimo/vite_ruby/commit/78b3104bc687a79aebd4e0538b8b7c34562cb4eb))



## [2.0.11](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@2.0.10...vite_rails@2.0.11) (2021-05-10)

### Refactor

* Avoid reference to `dry-cli` during installation, use internal APIs instead ([f5b87e](https://github.com/ElMassimo/vite_ruby/commit/f5b87e69790e48397d15e609b44118e399c9493d))


## [2.0.10](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@2.0.9...vite_rails@2.0.10) (2021-04-21)


### Features

* Add helpers to enable HMR when using @vitejs/plugin-react-refresh ([a80f286](https://github.com/ElMassimo/vite_ruby/commit/a80f286d4305bbae29ea7cea42a4329a530f43fa))



## [2.0.9](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@2.0.8...vite_rails@2.0.9) (2021-04-15)


### Bug Fixes

* Allow passing additional attributes to scripts and stylesheets. ([edf6019](https://github.com/ElMassimo/vite_ruby/commit/edf6019fa83646e413f36d289eac89bb2f8042a5))



## [2.0.8](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@2.0.7...vite_rails@2.0.8) (2021-03-20)


### Bug Fixes

* Simplify installation of build dependencies by using package manager flags ([5c8bb62](https://github.com/ElMassimo/vite_ruby/commit/5c8bb625926f2ab1788a3e3a22aeafd7104984cb))



## [2.0.7](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@2.0.6...vite_rails@2.0.7) (2021-03-19)


### Bug Fixes

* Typo typecript -> typescript in tag helpers ([#38](https://github.com/ElMassimo/vite_ruby/issues/38)) ([3d375df](https://github.com/ElMassimo/vite_ruby/commit/3d375df8553c8542966ac912a38fe70b7d59ba74))



## [2.0.6](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@2.0.5...vite_rails@2.0.6) (2021-03-18)

* Add more help text in the example entrypoints  ([87d6f14](https://github.com/ElMassimo/vite_ruby/commit/87d6f14a59bba2667089bb952960dce059f36592))

## [2.0.5](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@2.0.4...vite_rails@2.0.5) (2021-03-18)


### Bug Fixes

* Using a .jsx extension in a tag helper in development ([a56491b](https://github.com/ElMassimo/vite_ruby/commit/a56491b96720ae537b6b6305aa7efa70cf19e4ee))



## [2.0.4](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@2.0.3...vite_rails@2.0.4) (2021-03-09)


### Features

* Detect installations of the latest version of Webpacker (app/packs) ([e9a3bc0](https://github.com/ElMassimo/vite_ruby/commit/e9a3bc02475dbadac77e58b3980a4af8df5aaa02))



## [2.0.3](https://github.com/ElMassimo/vite_ruby/compare/vite_rails@2.0.2...vite_rails@2.0.3) (2021-03-07)

- Add a bounded requirement to `vite_ruby` dependency.

## Vite Rails 2.0.2  (2020-02-11)

- Automatically infer `app/javascript` as the `sourceCodeDir` if it exists.

## Vite Rails 2.0.1  (2020-02-11)

- Add the CSP rules commented out when installing, in case the user hasn't uncommented them yet.

## Vite Rails 2.0.0  (2020-02-10)

- Extracted core functionality to `vite_ruby`.
- User-facing API hasn't really changed, but internal classes have been renamed.
- Installation script now injects tags to `application.html.erb` if it exists.

## Vite Rails 1.0.12  (2020-01-29)

- Add support for Vite 2.0.0-beta.56, which modified the manifest to output a `css` field in the manifest.
- Start generating an assets manifest, since 2.0.0-beta.51 stopped including non-JS entrypoints in the manifest.

## Vite Rails 1.0.11  (2020-01-24)

- Fix bug in `assetHost` that caused `base` to be configured incorrectly.
- Allow installing `vite` and `vite-plugin-ruby` as devDependencies, and install them when precompiling assets.
- Move `base` to the configuration root after Vite's update in beta.38

## Vite Rails 1.0.10  (2020-01-23)

- Use `path_to_asset` in `vite_asset_path` so that it's prefixed automatically
  when using a CDN (`config.action_controller.asset_host`).

## Vite Rails 1.0.9  (2020-01-22)

- Ensure `configPath` and `publicDir` are scoped from `root`, both in Ruby and JS.

## Vite Rails 1.0.8  (2020-01-21)

- Change the default of `sourceCodeDir` to `app/frontend`, add instructions for folks migrating
from a `app/javascript` structure.

## Vite Rails 1.0.7  (2020-01-20)

- Add `vite_client_tag` to ensure the Vite client can be loaded in apps that don't use any imports.

## Vite Rails 1.0.6  (2020-01-20)

- Ensure running `bin/rake assets:precompile` automatically invokes `vite:build`.

## Vite Rails 1.0.5  (2020-01-20)

- Automatically add `<link rel="modulepreload">` and `<link rel="stylesheet">` when using `vite_javascript_tag`, which simplifies usage.

## Vite Rails 1.0.4  (2020-01-19)

- Remove Vue specific examples from installation templates, to ensure they always run.

## Vite Rails 1.0.0 (2020-01-18)

Initial Version
