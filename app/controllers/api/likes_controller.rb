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
    @like = Match.find(params[:id])
    @like.destroy
    render json: @like
  end

  private
  def like_params
    params.require(:like).permit(:user_id)
  end
end
