json.array! @crushes do |crush|
  json.extract! crush, :id, :username, :age
end
