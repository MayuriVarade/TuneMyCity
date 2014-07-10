json.array!(@users) do |user|
  json.extract! user, :id, :city_id, :country_id, :state_id
  json.url user_url(user, format: :json)
end