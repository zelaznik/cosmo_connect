class Api::LikesController < ApplicationController
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
