class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      sign_in(@user)
      redirect_to tweets_url
    else
      @user = User.new
      flash.now[:errors] = ['Invalid username or password.']
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end

end
