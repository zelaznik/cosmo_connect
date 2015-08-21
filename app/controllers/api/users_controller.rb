class Api::UsersController < Api::BaseController
  before_action :ensure_current_user, only: [:update]

  def show
    @user = User.find(params[:id])
    # Save that the visit took place before rendering
    if @user!= current_user
      Visit.new(visitor: current_user, profile: @user).save
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @exclude_blank_responses = true
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def index
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:gender_id, :birthdate)
  end

  def ensure_current_user
    if params[:id].to_i != current_user.id
      raise "Cannot modify attributes of another user."
    end
  end

end
