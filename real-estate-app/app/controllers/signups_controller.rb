class SignupsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  skip_before_action :verify_authenticity_token

  def create
    signup = House.create!(house_params)
    render json: house
  end


  private

  def house_params
    params.permit(:address, :lotSizeAcres, :lotSizeSquareFeet, :listPrice, :bathroomsTotal, :bedroomsTotal)
  end

  def render_not_found
    render json: {error: "Hmmm, there might be something wrong, I can't find the login page"}, status: 404
  end

  def render_unprocessable_entity invalid
    render json: {errors: invalid.record.errors.full_messages}, status:422
  end

end
