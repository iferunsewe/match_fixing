json.array!(@teams) do |team|
  json.extract! team, :id, :name, :hometown, :wins, :losses, :draws, :rating, :seeking_players
  json.url team_url(team, format: :json)
end
