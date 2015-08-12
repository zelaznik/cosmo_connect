class UsersController < ApplicationController
  def new
    @user = User.new
    @genders = Gender.all
    @ethnicities = Ethnicity.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to tweets_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username,:password,:birthdate,:gender_id)
  end
end
