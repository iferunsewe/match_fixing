module TeamsHelper

  def combined_team_matches(team)
    team.matches.inject(team.reverse_team_match, :<<)
  end
end
