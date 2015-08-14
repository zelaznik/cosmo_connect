json.extract! @user, :id, :username, :age
json.gender @user.gender.name

json.details do
  json.ethnicity @user.ethnicity.description
  json.religion @user.religion.title
  json.height @user.details.height
  json.body_type @user.body_type.description
  json.relationship_status @user.relationship_status.description
end

json.responses do
  json.array! @user.responses do |r|
    json.response_category_id r.response_category_id
    json.title r.response_category.title
    json.body r.body
  end
end
