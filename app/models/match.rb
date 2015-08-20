class Match < ActiveRecord::Base
  attr_accessible :date, :team_a_score, :team_b_score, :status, :team_a_id, :team_b_id, :ground_id,
                  :ground_attributes
                  # :goal_attributes, :appearance_attributes,:man_of_the_match_attributes

  belongs_to :team_a, :class_name => :Team
  belongs_to :team_b, :class_name => :Team
  belongs_to :ground
  has_many :stats

  accepts_nested_attributes_for :ground

  def show_teams_unless_current_team(current_player)
    teams = Team.all
    teams.select do |team|
      team != current_player.team
    end
  end

  def display_status(match_status)
    match_status ? 'Confirmed' : 'Pending'
  end
end
