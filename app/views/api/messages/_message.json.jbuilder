json.extract! m, :id, :sender_id, :receiver_id, :body
other_user = (m.sender == current_user ? m.receiver : m.sender)
json.sender m.sender.username
json.receiver m.receiver.username
json.sender_photo m.sender.photos.first.thumb_url
json.receiver_photo m.receiver.photos.first.thumb_url

json.direction ((m.receiver == current_user) ? 'From' : 'To' )
json.other_username other_user.username
json.other_user_id other_user.id
json.timestamp m.created_at.strftime('%b %d %H:%M')
