class Match < ActiveRecord::Base
  attr_accessible :date, :team_a_score, :team_b_score, :status, :team_a_id, :team_b_id, :ground_id,
                  :ground_attributes, :stats_attributes

  belongs_to :team_a, :class_name => :Team
  belongs_to :team_b, :class_name => :Team
  belongs_to :ground
  has_many :stats
  has_many :players, through: :stats
  after_create :init_stats_for_players # Used to create a stat for each player when a match is created.


  accepts_nested_attributes_for :ground, :stats

  def show_teams_unless_current_team(current_player)
    teams = Team.all
    teams.select do |team|
      team != current_player.team
    end
  end

  def display_status(match_status)
    match_status ? 'Played' : 'Pending'
  end

  def played_and_rated_before(rater, team, match)
    current_player_ratings = Rating.where(team_id: team.id, rater: rater.id)
    rating_after_match = Rating.where(team_id: team.id, rater: rater.id).where("created_at < ?", match.date)
    if current_player_ratings.size < 1 || rating_after_match != []
      true
    else
      false
    end
  end

  def self.show_matches?(player_visited=nil, team_visited=nil, match)
    if !player_visited.nil?
      player_visited.team == match.team_a || player_visited.team == match.team_b
    else
      team_visited == match.team_a || team_visited == match.team_b
    end
  end

    private

    def init_stats_for_players
      self.team_a.players.each do |player|
        player.stats.create(player_id: player.id, match_id: self.id)
      end
      self.team_b.players.each do |player|
        player.stats.create(player_id: player.id, match_id: self.id)
      end
    end
end
