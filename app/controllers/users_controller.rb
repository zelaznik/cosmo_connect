class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @details = DetailsOfUser.new({user: @user})
    if @user.save && @details.save
      sign_in @user
      redirect_to root_url(new_user: true)
    else
      flash.now[:errors] = @user.errors.full_messages
      flash.now[:errors] += @details.errors.full_messages
      render :new, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
