json.extract! @user, :id, :username, :age
json.gender @user.gender.name

json.details do
  arr = []
  arr << [1, 'ethnicity', @user.ethnicity.description]
  arr << [2, 'religion', @user.religion.title]
  arr << [3, 'height', @user.details.height]
  arr << [4, 'body_type', @user.body_type.description]
  arr << [5, '']

  json.religion @user.religion.title
  json.height @user.details.height
  json.body_type @user.body_type.description
  json.relationship_status @user.relationship_status.description
end

json.responses do
  json.array! @user.responses_with_blanks do |r|
    json.response_category_id r.response_category_id
    json.title r.response_category.title
    json.body r.body
  end
end
