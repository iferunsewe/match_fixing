json.array!(@matches) do |match|
  json.extract! match, :id, :date, :status, :team_a_score, :team_b_score, :team_a_id, :team_b_id
  json.url match_url(match, format: :json)
end
