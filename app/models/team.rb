class Team < ActiveRecord::Base
  attr_accessible :name, :hometown, :wins, :losses, :draws, :rating_id,
                  :seeking_players, :points, :philosophy, :league_id,
                  :played, :primary_kit_colour, :secondary_kit_colour, :image

  has_many(:matches, :foreign_key => :team_a_id, :dependent => :destroy)
  has_many(:reverse_team_match, :class_name => :Match, :foreign_key => :team_b_id, :dependent => :destroy)
  has_many :teams, :through => :matches, :source => :team_b
  has_many :players
  has_many :ratings, dependent: :destroy
  belongs_to :league
  mount_uploader :image, TeamImageUploader

  accepts_nested_attributes_for :players

  def league_position(team)
    (team.league.teams.order(points: :desc).index(team) + 1).ordinalize
  end

  def calc_wins(team)
    @wins = Match.where(team_a_id: team.id, status: true).where("team_a_score > team_b_score").size + Match.where(team_b_id: team.id).where("team_b_score > team_a_score").size
  end

  def calc_losses(team)
    @losses = Match.where(team_a_id: team.id, status: true).where("team_a_score < team_b_score").size + Match.where(team_b_id: team.id).where("team_b_score < team_a_score").size
  end

  def calc_draws(team)
    @draws = Match.where(status: true).where("team_a_id = #{team.id} OR team_b_id = #{team.id}").where("team_a_score = team_b_score").size
  end

  def calc_points
    points = 0
    if @wins > 0 || @draws > 0
      @wins.times do |win|
        points += 3
      end
      @draws.times do |draw|
        points += 1
      end
    end
    points
  end
  # Works out the average rating of a team based on their players ratings and team ratings
  def average_rating(team)
    players_ratings = team.players.map do |player|
      player.average_rating
    end
    team_ratings_sum = players_ratings.sum + team.ratings.sum(:stars)
    team_ratings_size = players_ratings.select{|rating| rating > 0}.size + team.ratings.size
    team_ratings_sum / team_ratings_size
  end

  def players_names(team)
    team.players.map do |player|
      player.name
    end
  end

  def calc_matches(team)
    team.matches.where(status: true).size + team.reverse_team_match.where(status: true).size
  end
end
