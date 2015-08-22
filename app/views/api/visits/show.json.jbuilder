json.array! @users do |user|
  json.extract! user, :id, :username, :age
  json.gender user.gender.name
end
