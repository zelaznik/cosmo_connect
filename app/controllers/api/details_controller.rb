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
          {id: r.id, name: r.title, selected: (r.id == religion_id)}
        end
      }

    elsif k == 'relationship_status'
      model = current_user.details
      status_id = (v.select {|r| r[:selected]}).first[:id]
      update_params = {relationship_status_id: status_id}
      output_params = {
        id: :relationship_status,
        value: RelationshipStatus.all.map do |s|
          {id: s.id, name: s.description, selected: (s.id == status_id)}
        end
      }

    elsif k == 'body_type'
      model = current_user.details
      body_type_id = (v.select {|r| r[:selected]}).first[:id]
      update_params = {body_type_id: body_type_id}
      output_params = {
        id: :body_type,
        value: BodyType.all.map do |t|
          {id: t.id, name: t.description, selected: (t.id == body_type_id)}
        end
      }

    elsif k == 'ethnicity'
      model = current_user.details
      ethnicity_id = (v.select {|r| r[:selected]}).first[:id]
      update_params = {ethnicity_id: ethnicity_id}
      output_params = {
        id: :ethnicity,
        value: Ethnicity.all.map do |e|
          {id: e.id, name: e.description, selected: (e.id == ethnicity_id)}
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
