json.extract! m, :id, :sender_id, :receiver_id, :created_at, :body
other_user = (m.sender == current_user ? m.receiver : m.sender)
json.sender m.sender.username
json.other_username other_user.username
json.other_user_id other_user.id
