json.array!(@users) do |user|
  json.extract! user, :id, :name, :type
  json.url user_url(user, format: :json)
end
