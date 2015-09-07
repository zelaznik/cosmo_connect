json.extract! user, :id, :username, :age
json.gender getter(user.gender, 'name')
json.is_liked current_user.has_crush_on(user)
(json.like likes[user.id].id) if likes[user.id]

json.interested_in do
  names = []
  user.desired_genders.each do |desire|
    next unless desire.interested
    names << desire.gender.name.pluralize
  end
  json.array! names
end
