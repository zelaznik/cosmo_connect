def getter(obj, methodname)
  obj ? obj.send(methodname) : nil
end

json.array! @users.includes(:gender) do |user|
  next if user == current_user
  json.extract! user, :id, :username, :age
  json.gender getter(user.gender, 'name')
  if signed_in?
    json.is_liked current_user.has_crush_on(user)
  end
end
