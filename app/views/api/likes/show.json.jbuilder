def getter(obj, methodname, alt_value = nil)
  obj ? obj.send(methodname) : alt_value
end

json.array! @users do |user|
  json.extract! user, :id, :username
  json.age getter(user, 'age', 'age unspecified')
  json.gender getter(user.gender, 'name', 'gender unspecified')
end
