class Api::PhotosController < ApplicationController
  def index
    render json: User.find(params[:user_id]).photos
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    if @photo.save
      render json: photo
    else
      render json: {message: 'failure'}, status: 422
    end
  end

  def show
    @photo = Photo.find(params[:id])
    render json: @photo
  end

  private
  def photo_params
    h = params.require(:photo).permit(:url, :thumb_url)
  end
end
