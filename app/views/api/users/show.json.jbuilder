def getter(obj, methodname)
  obj ? obj.send(methodname) : nil
end

json.extract! @user, :id, :username, :age
json.gender getter(@user.gender, 'name')

json.details do
  # arr = []
  # arr << [1, 'ethnicity', getter(@user.ethnicity, 'description')]
  # arr << [2, 'religion', getter(@user.religion, 'title')]
  # arr << [3, 'height', getter(@user.details, 'height')]
  # arr << [4, 'body_type', getter(@user.body_type, 'description')]

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
