def getter(obj, methodname)
  obj ? obj.send(methodname) : nil
end

json.array! @users do |user|
  json.extract! user, :id, :username, :age
  json.gender getter(user.gender, 'name')
end
