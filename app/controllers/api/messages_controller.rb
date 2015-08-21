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
        @messages = current_user.sent_messages
      when 'received'
        @messages = current_user.received_messages
      else
        render json: Message.find(params[:id])
    end
  end

  def index
    other_user = User.find(params[:user_id])
    @messages = current_user.emails_with(other_user)
    render :show
  end

  private
  def message_params
    params.require(:message).permit(:receiver_id, :body)
  end

end
