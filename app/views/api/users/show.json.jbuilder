def getter(obj, methodname)
  obj ? obj.send(methodname) : nil
end

is_current_user = (@user == current_user)

json.extract! @user, :id, :username, :age
json.gender getter(@user.gender, 'name')

desires = @user.desired_genders.includes(:gender).order(:gender_id)

json.photo getter(@user.photos.first, 'thumb_url')

@details = @user.details

if current_user && (current_user != @user)
  Match.where(sender: current_user, receiver: @user).each do |like|
    json.like like.id
    break
  end
end

details_array = []

if not is_current_user
  item = @user.age
else
  item = {
      year: getter(@user.birthdate, 'year'),
      month: getter(@user.birthdate, 'month'),
      day: getter(@user.birthdate, 'day')
   }
end
details_array << {category: :birthdate, value: item}


if not is_current_user
  item = getter(@user.gender, 'name')
else
  item = Gender.all.map {|g| {id: g.id, name: g.name, selected: (@user.gender_id == g.id)}}
end
details_array << {category: :gender, value: item}

if not is_current_user
  item = desires.where(interested: true).map {|d| d.gender.plural}
else
  item = desires.map {|d| {id: d.id, name: d.gender.plural, selected: d.interested}}
end
details_array << {category: :interested_in, value: item}


#
# item = {min_age: @user.min_age, max_age: @user.max_age}
# details_array << {category: :ages, value: item}
#
# if not is_current_user
#   item = getter(@user.religion, 'title')
# else
#   item = Religion.all.map do |r|
#     {id: r.id, name: r.title, selected: (@details.religion_id == r.id)}
#   end
# end
# details_array << {category: :religion, value: item}
#
# if not is_current_user
#   item = @details.relationship_status
# else
#   item = RelationshipStatus.all.map do |s|
#       {id: s.id, name: s.description, selected: (@details.relationship_status_id == s.id)}
#   end
# end
# details_array << {category: :relationship_status, value: item}
#
# if not is_current_user
#   item = getter(@details.body_type, 'description')
# else
#   item = BodyType.all.map do |t|
#     {id: t.id, name: t.description, selected: (@details.body_type_id == t.id)}
#   end
# end
# details_array << {category: :body_type, value: item}
#
# item = @details.height
# details_array << {category: :height, value: item}
#
# if not is_current_user
#   item = getter(@details.ethnicity, 'description')
# else
#   item = Ethnicity.all.map do |e|
#     {id: e.id, name: e.description, selected: (@details.ethnicity_id == e.id)}
#   end
# end
# details_array << {category: :ethnicity, value: item}

json.details do
  json.array! details_array
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

if not is_current_user
  json.messages do
    messages = @user.emails_with(current_user)
    json.array! messages.includes(:sender, :receiver).order(:created_at) do |m|
      json.partial! 'api/messages/message', m: m
    end
  end
end
