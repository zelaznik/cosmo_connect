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
      model = current_user
      gender_id = (v.select {|g| g[:selected]}).first[:id]
      update_params = {gender_id: gender_id}
      output_params = {
        id: :gender,
        value: Gender.all.map do |g|
          {id: g.id, name: g.name, selected: (g.id == gender_id)}
        end
      }

    elsif k == 'religion'
      model = current_user.details
      religion_id = (v.select {|r| r[:selected]}).first[:id]
      update_params = {religion_id: religion_id}
      output_params = {
        id: :religion,
        value: Religion.all.map do |r|
          {id: r.id, name: r.name, selected: (r.id == religion_id)}
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
