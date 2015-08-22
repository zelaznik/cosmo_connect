json.array! @users.includes(:gender) do |user|
  json.extract! user, :id, :username, :age
  json.gender user.gender.name
end
