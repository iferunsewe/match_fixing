json.array!(@stats) do |stat|
  json.extract! stat, :id, :appearances, :goals, :man_of_the_match
  json.url stat_url(stat, format: :json)
end
