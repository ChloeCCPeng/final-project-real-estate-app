class HousesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def index
    render json: House.all
  end


  def create
    house = House.create!(house_params)
    render json: house, status: created
  end


  def show
    house = find_house
    render json: house
  end


  def update
    house = find_house
    house.update!(house_params)
    render json: house, status: updated
  end


  def destroy
    house = find_house
    house.destroy
  end


  private
  
  def house_params
    params.permit(:address, :lotSizeAcres, :lotSizeSquareFeet, :listPrice, :bathroomsTotal, :bedroomsTotal)
  end


  def find_house
    House.find(params[:id])
  end


  def render_not_found
    render json: {error: "Hey, I can't find any house"}, status: 404
  end


  def render_unprocessable_entity invalid
    render json: {errors: invalid.record.errors.full_messages}, status:422
  end


end