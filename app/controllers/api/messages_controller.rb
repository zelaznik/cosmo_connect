class Api::MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    if @message.save
      render json: @message
    else
      render json: @message.errors.full_messages, status: 422
    end
  end

  def show
    # This is a hack way to return indexes of messages
    # based on different search criteria
    m = params[:id].downcase
    case m
      when 'sent'
        @messages = current_user.sent_messages
      when 'received'
        @messages = current_user.received_messages
      else
        render json: ["Unsupported method: '#{m}'"], status: 422
    end
  end

end
