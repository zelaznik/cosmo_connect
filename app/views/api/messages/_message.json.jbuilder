json.extract! m, :id, :sender_id, :receiver_id, :body
other_user = (m.sender == current_user ? m.receiver : m.sender)
json.sender m.sender.username
json.receiver m.receiver.username
json.is_received (m.receiver == current_user)
json.other_username other_user.username
json.other_user_id other_user.id
json.timestamp m.created_at.strftime('%b %d %H:%M')
