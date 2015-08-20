json.array!(@leagues) do |league|
  json.extract! league, :id, :name, :location
  json.url league_url(league, format: :json)
end
