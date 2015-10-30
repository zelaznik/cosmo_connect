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

json.details do
  if not is_current_user
    json.age @user.age
  else
    json.birthdate do
      json.year getter(@user.birthdate, 'year')
      json.month getter(@user.birthdate, 'month')
      json.day getter(@user.birthdate, 'day')
    end
  end

  if not is_current_user
    json.gender getter(@user.gender, 'name')
  else
    json.gender do
      json.array! Gender.all do |gender|
        json.id gender.id
        json.singular gender.name
        json.selected (@user.gender_id == gender.id)
      end
    end
  end

  if not is_current_user
    json.interested_in do
      names = desires.where(interested: true).map do |desire|
        desire.gender.name.pluralize
      end
      json.array! names
    end
  else
    json.interested_in do
      json.array! desires do |desire|
        json.extract! desire, :id, :gender_id
        json.name desire.gender.name.pluralize
        json.selected desire.interested
      end
    end
  end

  json.ages do
    json.min_age @user.min_age
    json.max_age @user.max_age
  end

  if not is_current_user
    json.religion getter(@user.religion, 'title')
  else
    json.religion do
      json.array! Religion.all do |religion|
        json.id religion.id
        json.name religion.title
        json.selected (@details.religion_id == religion.id)
      end
    end
  end

  if not is_current_user
    json.relationship_status getter(@details.relationship_status)
  else
    json.relationship_status do
      RelationshipStatus.all do |status|
        json.id status.id
        json.name status.description
        json.selected (@details.relationship_status_id == status.id)
      end
    end
  end

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

if not is_current_user
  json.messages do
    messages = @user.emails_with(current_user)
    json.array! messages.includes(:sender, :receiver).order(:created_at) do |m|
      json.partial! 'api/messages/message', m: m
    end
  end
end
