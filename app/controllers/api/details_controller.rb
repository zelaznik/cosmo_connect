class Api::DetailsController < ApplicationController
  def update
    debugger
    k = params[:category]
    v = params[:value]

    if k == 'birthdate'
      b = v[:birthdate]
      b = Date.new(b[:year].to_i, b[:month].to_i, b[:day].to_i)
      update_params = {birthdate: b}
      model = current_user
      output_params = {category: k, value: v}

    elsif k == 'gender'
      update_params = v
      model = current_user.details
      output_params = {
        category: :gender_id,
        value: Gender.all.map do |g|
          {id: g.id, name: g.name, selected: (g.id == v[:gender_id])}
        end
      }

    end

    if params[:id].to_i != current_user.id
      render json: ["Cannot modify attributes of another user"], status: 422
    elsif model.update(update_params)
      render json: output_params
    else
      render json: model.errors.full_messages, status: 422
    end
  end

end
