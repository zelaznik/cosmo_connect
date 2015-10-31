class Api::DetailsController < ApplicationController
  def update
    k = params[:id]
    v = params[:value]

    if k == 'birthdate'
      model = current_user
      b = Date.new(v[:year].to_i, v[:month].to_i, v[:day].to_i)
      update_params = {birthdate: b}
      output_params = {id: k, value: {year: b.year, month: b.month, day: b.day}}

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

    if model.update(update_params)
      render json: output_params
    else
      render json: model.errors.full_messages, status: 422
    end
  end

end
