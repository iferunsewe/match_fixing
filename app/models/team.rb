class Team < ActiveRecord::Base
  attr_accessible :name, :hometown, :wins, :losses, :draws, :rating_id,
                  :seeking_players, :points, :kit, :philosophy, :league_id

  has_many(:matches, :foreign_key => :team_a_id, :dependent => :destroy)
  has_many(:reverse_team_match, :class_name => :Match, :foreign_key => :team_b_id, :dependent => :destroy)
  has_many :teams, :through => :matches, :source => :team_b
  has_many :players
  has_many :ratings
  belongs_to :league

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
  # Works out the average rating of a team based on their players ratings
  def average_rating(team)
    players_ratings = team.players.map do |player|
      player.average_rating
    end
    players_ratings.sum / players_ratings.size
  end

  def players_names(team)
    team.players.map do |player|
      player.name
    end
  end
end
