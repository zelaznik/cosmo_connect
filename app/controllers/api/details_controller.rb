class Api::DetailsController < ApplicationController
  def update
    if params[:id] == 'gender_identity'
      current_user.gender_id = params[:value]
      if current_user.save
        render json: {gender: current_user.gender.name}
      else
        render json: current_user.errors.full_messages, status: 422
      end

    else
      render json: ["Unsupported route: #{params[:id]}"]
    end
  end

end
