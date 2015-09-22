class Team < ActiveRecord::Base
  attr_accessible :name, :hometown, :wins, :losses, :draws, :rating_id,
                  :seeking_players, :points, :primary_colour, :philosophy, :league_id,
                  :played, :secondary_colour, :image

  has_many(:matches, :foreign_key => :team_a_id, :dependent => :destroy)
  has_many(:reverse_team_match, :class_name => :Match, :foreign_key => :team_b_id, :dependent => :destroy)
  has_many :teams, :through => :matches, :source => :team_b
  has_many :players
  has_many :ratings
  belongs_to :league
  mount_uploader :image, TeamImageUploader

  accepts_nested_attributes_for :players

  def calc_wins(team)
    wins = Match.where(team_a_id: team.id).where("team_a_score > team_b_score")
    @wins = wins.size
  end

  def calc_losses(team)
    losses = Match.where(team_a_id: team.id).where("team_a_score < team_b_score")
    @losses = losses.size
  end

  def calc_draws(team)
    draws = Match.where(team_a_id: team.id).where("team_a_score = team_b_score")
    @draws = draws.size
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
