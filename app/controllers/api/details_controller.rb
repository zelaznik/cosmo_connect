class Api::DetailsController < ApplicationController
  def update
    if params[:id] == 'gender_identity'
      current_user.gender_id = params[:value]
      if current_user.save
        render json: {gender: current_user.gender.name}
      else
        render json: current_user.errors.full_messages, status: 422
      end

    elsif params[:id] == 'interested_in'
      d = DesiredGender.where(user: current_user, gender_id: params[:key]).first
      if d.update(interested: params[:value])
        prefs = DesiredGender.where(user: current_user, interested: true).includes(:gender)
        render json: {interested_in: prefs.order(:gender_id).all.map {|d| d.gender.plural}}
      else
        render json: d.errors.full_messages, status: 422
      end

    else
      render json: ["Unsupported route: #{params[:id]}"]
    end
  end

end
