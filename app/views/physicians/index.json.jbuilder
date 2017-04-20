json.array!(@physicians) do |physician|
  json.extract! physician, :id, :physician_name
  json.url physician_url(physician, format: :json)
end
