class Api::LikesController < ApplicationController
  def create
    @like = current_user.crushes.new(like_params)

    if @like.save
      render json: @like
    else
      render json: @like.errors.full_messages, status: 422
    end
  end

  def destroy
    @like = Match.find_by(params[:id])
    if @like.sender == current_user
      @like.destroy
      render json: @like
    else
      render json: ['Cannot modify the likes of another user'], status: 422
    end
  end

  private
  def like_params
    params.require(:like).permit(:sender_id, :receiver_id)
  end
end
