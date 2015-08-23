class Api::LikesController < Api::BaseController

  def show
    #This is actually a hijacked index view.
    @gender_name = Hash[Gender.all.collect {|g| [g.id, g.name]}]
    m = params[:id].downcase
    case m
      when 'crushes'
        @users = current_user.crushes
      when 'secret_admirers'
        @users = current_user.secret_admirers
      when 'soulmates'
        @users = current_user.soulmates
      else
        render json: ["Unsupported method: '#{m}'"], status: 422
    end
  end

  def create
    @like = Match.new(like_params)
    @like.sender = current_user
    if @like.save
      render json: @like
    else
      render json: @like.errors.full_messages, status: 422
    end
  end

  def destroy
    @like = Match.find(params[:id])
    if @like.sender == current_user
      @like.destroy
      render json: {}
    else
      render json: ['Cannot modify the likes of another user'], status: 422
    end
  end

  private
  def like_params
    params.require(:like).permit(:receiver_id)
  end
end
