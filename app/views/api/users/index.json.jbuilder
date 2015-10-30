def getter(obj, methodname)
  obj ? obj.send(methodname) : nil
end

likes = {}
Match.where(sender: current_user).each do |like|
  likes[like.receiver_id] = like
end

json.array! @users.includes(:gender).includes(:photos, desired_genders: :gender) do |user|
  next if user == current_user
  json.extract! user, :id, :username, :age
  json.gender getter(user.gender, 'name')
  json.is_liked current_user.has_crush_on(user)
  (json.like likes[user.id].id) if likes[user.id]
  json.photo getter(user.photos.first, 'url')

  names = []
  user.desired_genders.each do |d|
    names << d.gender.plural if d.interested
  end
  json.preferences names.join(", ")

end
