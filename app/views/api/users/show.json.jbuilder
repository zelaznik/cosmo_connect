def getter(obj, methodname)
  obj ? obj.send(methodname) : nil
end

is_current_user = (@user == current_user)

json.extract! @user, :id, :username, :age
json.gender getter(@user.gender, 'name')

if is_current_user
  json.birthdate do
    json.year getter(@user.birthdate, 'year')
    json.month getter(@user.birthdate, 'month')
    json.day getter(@user.birthdate, 'day')
  end

  json.gender_id @user.gender_id

  json.genders do
    json.array! Gender.all do |gender|
      json.id gender.id
      json.singular gender.name
      json.selected (@user.gender_id == gender.id)
    end
  end

end

desires = @user.desired_genders.includes(:gender).order(:gender_id)

json.desired_genders do
  json.array! desires do |desire|
    json.extract! desire, :id, :gender_id, :interested
    json.name desire.gender.name
    json.singular desire.gender.name
    json.plural desire.gender.name.pluralize
  end
end

json.interested_in do
  names = desires.where(interested: true).map do |desire|
    desire.gender.name.pluralize
  end
  json.array! names
end

json.photo getter(@user.photos.first, 'url')

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

responses = @user.responses.includes(:response_category).order(:response_category_id)

json.responses do
  json.array! responses do |r|
    json.id r.id
    json.response_category_id r.response_category_id
    json.title r.response_category.title
    json.body r.body
  end
end
