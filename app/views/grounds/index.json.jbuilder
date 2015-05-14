json.array!(@grounds) do |ground|
  json.extract! ground, :id, :address, :name, :image
  json.url ground_url(ground, format: :json)
end
