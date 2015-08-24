def getter(obj, methodname)
  obj ? obj.send(methodname) : nil
end

is_current_user = (@user == current_user)

json.extract! @user, :id, :username

if not is_current_user
  json.age @user.age
  json.gender getter(@user.gender, 'name')

  json.interested_in do
    preferences = @user.desired_genders.includes(:gender)
    json.array! preferences.map {|pref| pref.gender.name.pluralize}
  end

else
  json.birthdate do
    json.year getter(@user.birthdate, 'year')
    json.month getter(@user.birthdate, 'month')
    json.day getter(@user.birthdate, 'day')
  end

  json.gender_id @user.gender_id

  json.genders do
    json.array! Gender.all do |gender|
      json.id gender.id
      json.name gender.name
      json.singular gender.name
      json.plural gender.name.pluralize
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
  json.array! @user.responses.includes(:response_category) do |r|
    json.id r.id
    json.response_category_id r.response_category_id
    json.title r.response_category.title
    json.body r.body
  end
end
