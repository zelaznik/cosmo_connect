class StaticPagesController < ApplicationController
  before_action :redirect_if_not_signed_in

  def root
    @logged_in = true
    @new_user = new_user
  end

  def new_user
    !!params[:new_user]
  end

end
