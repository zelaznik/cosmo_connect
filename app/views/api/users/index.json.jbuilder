def getter(obj, methodname)
  obj ? obj.send(methodname) : nil
end

json.array! @users.includes(:gender, desired_genders: :gender) do |user|
  next if user == current_user
  json.extract! user, :id, :username, :age
  json.gender getter(user.gender, 'name')
  json.is_liked current_user.has_crush_on(user)

  json.desired_genders do
    json.array! user.desired_genders.order(:gender_id) do |desire|
      json.extract! desire, :id, :gender_id, :interested
      json.name desire.gender.name
      json.singular desire.gender.name
      json.plural desire.gender.name.pluralize
    end
  end

end
