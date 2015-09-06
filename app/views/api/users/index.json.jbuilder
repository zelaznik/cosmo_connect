def getter(obj, methodname)
  obj ? obj.send(methodname) : nil
end

json.array! @users.includes(:gender).includes(desired_genders: :gender) do |user|
  next if user == current_user
  json.extract! user, :id, :username, :age
  json.gender getter(user.gender, 'name')
  json.is_liked current_user.has_crush_on(user)

  #desires = user.desired_genders.includes(:gender).order(:gender_id)

  json.interested_in do
    names = []
    user.desired_genders.each do |desire|
      next unless desire.interested
      names << desire.gender.name.pluralize
    end
    json.array! names
  end

end
