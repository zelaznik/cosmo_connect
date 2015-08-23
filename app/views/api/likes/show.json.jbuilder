json.array! @users do |user|
  json.extract! user, :id, :username
  json.age user.age || 'age unspecified'
  json.gender @gender_name[user.gender_id] || 'gender unspecified'
end
