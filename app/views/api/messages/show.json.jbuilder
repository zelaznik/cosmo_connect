json.array! @messages do |message|
  json.extract! message, :id, :sender_id, :receiver_id, :created_at, :body
end
