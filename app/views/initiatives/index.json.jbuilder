json.array!(@initiatives) do |initiative|
  json.extract! initiative, :id, :latitude, :longitude, :address, :initiative_description, :title
  json.url user_url(initiative, format: :json)
end
