def getter(obj, methodname)
  obj ? obj.send(methodname) : nil
end
is_current_user = (@user == current_user)

json.extract! @user, :id, :username

if not is_current_user
  json.age @user.age
  json.gender getter(@user.gender, 'name')
else
  json.birthdate @user.birthdate.strftime("%Y-%m-%d")
  json.gender_id @user.gender_id
  json.genders do
    json.array! Gender.all do |gender|
      json.extract! gender, :id, :name
    end
  end
end

json.photos do
  json.array! @user.photos
end

if current_user && (current_user != @user)
  Match.where(sender: current_user, receiver: @user).each do |like|
    json.like like.id
    break
  end
end

json.details do
  json.religion getter(@user.religion, 'title')
  json.height getter(@user.details, 'height')
  json.body_type getter(@user.body_type, 'description')
  json.relationship_status getter(@user.relationship_status, 'description')
end

json.responses do
  json.array! @user.responses_with_blanks do |r|
    json.id r.id
    json.response_category_id r.response_category_id
    json.title r.response_category.title
    json.body r.body
  end
end
