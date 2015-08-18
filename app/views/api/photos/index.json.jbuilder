json.array! @photos do |photo|
  json.extract! photo, :id, :description, :created_at, :url, :thumb_url
end
