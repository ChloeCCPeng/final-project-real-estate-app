class LoginController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  skip_before_action :verify_authenticity_token

  def index
    render json: Signup.all
  end

  def show
    login = Login.find_login
    render json: login
  end

  private

  def find_login
    Login.find(params[:id])
  end

  def render_not_found
    render json: {error: "Hmmm, there might be something wrong, I can't find the login page"}, status: 404
  end

  def render_unprocessable_entity invalid
    render json: {errors: invalid.record.errors.full_messages}, status:422
  end

end
