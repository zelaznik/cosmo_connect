class Api::ResponsesController < ApplicationController

  def new
    @response = Response.new(response_params)
    @response.user = current_user
    if @response.save
      render json: {}
    else
      render json: @response.errors.full_messages
    end
  end

  def update
    @response = Response.find(params[:id])
    if @response.update(response_params)
      render json: {}
    else
      render json: @response.errors.full_messages
    end
  end

  private
  def response_params
    params.require(:response).permit(:id, :response_category_id, :body)
  end

end
