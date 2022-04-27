class MessagesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  skip_before_action :verify_authenticity_token

  def index
    render json: Message.all
  end

  def create
    message = Message.create!(message_params)
    render json: message
  end

  def show
    message = find_message
    render json: message
  end

  def update
    message = find_message
    message.update!(message_params)
    render json: message
  end

  def destroy
    message = find_message
    message.destroy
  end


  private
  
  def message_params
    params.permit(:conversation, :user_id)
  end

  def find_message
    Message.find(params[:id])
  end

  def render_not_found
    render json: {error: "Hmmm, there might be something wrong, I can't find any message"}, status: 404
  end

  def render_unprocessable_entity invalid
    render json: {errors: invalid.record.errors.full_messages}, status:422
  end

end
