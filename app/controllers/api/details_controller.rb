class Api::DetailsController < ApplicationController
  def update
    raise NotImplementedError
    # if params[:id] == 'gender_identity'
    #   if current_user.update(gender_id: params[:value])
    #     render json: current_user.json_preview
    #   else
    #     render json: current_user.errors.full_messages, status: 422
    #   end
    #
    # elsif params[:id] == 'interested_in'
    #   d = DesiredGender.where(user: current_user, gender_id: params[:key]).first
    #   if d.update(interested: params[:value])
    #     prefs = DesiredGender.where(user: current_user, interested: true).includes(:gender)
    #     render json: current_user.json_preview
    #   else
    #     render json: d.errors.full_messages, status: 422
    #   end
    #
    # elsif params[:id] == 'birthdate'
    #   d = params[:birthdate]
    #   d = Date.new(year: d.year, month: d.month, day: d.day)
    #   if current_user.update(d)
    #     render json: current_user.json_preview
    #   else
    #     render json: d.errors.full_messages, status: 422
    #   end
    #
    # else
    #   render json: ["Unsupported route: #{params[:id]}"]
    # end
  end

end
