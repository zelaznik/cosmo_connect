class Api::PhotosController < ApplicationController
  def index
    @photos = User.find(params[:user_id]).photos
  end
end
