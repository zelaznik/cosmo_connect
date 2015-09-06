json.array! @users.includes(:gender).includes(desired_genders: :gender) do |user|
  json.extract! user, :id, :username
  json.age user.age || 'age unspecified'
  json.gender @gender_name[user.gender_id] || 'gender unspecified'

  json.interested_in do
    names = []
    user.desired_genders.each do |desire|
      next unless desire.interested
      names << desire.gender.name.pluralize
    end
    json.array! names
  end

end
