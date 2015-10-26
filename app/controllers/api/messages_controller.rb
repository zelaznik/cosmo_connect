class Api::MessagesController < Api::BaseController
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
    case params[:id].to_s.downcase
      when 'sent'
        @messages = current_user.sent_messages.order(created_at: :desc)
      when 'received'
        @messages = current_user.received_messages.order(created_at: :desc)
      else
        other_user = User.find(params[:id])
        @messages = current_user.emails_with(other_user).order(created_at: :desc)
    end

    render :show
  end

  private
  def message_params
    params.require(:message).permit(:receiver_id, :body)
  end

end
