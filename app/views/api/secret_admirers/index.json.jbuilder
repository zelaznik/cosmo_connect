json.array! @secret_admirers do |admirer|
  json.extract! admirer, :id, :username, :age
end
