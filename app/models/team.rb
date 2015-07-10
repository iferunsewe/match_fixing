class Team < ActiveRecord::Base
  attr_accessible :name, :hometown, :wins, :losses, :draws, :rating_id, :seeking_players

  has_many(:matches, :foreign_key => :team_a_id, :dependent => :destroy)
  has_many(:reverse_team_match, :class_name => :Match, :foreign_key => :team_b_id, :dependent => :destroy)
  has_many :teams, :through => :matches, :source => :team_b
  has_many :players
  has_many :ratings

  # Works out the average rating of a team based on their players ratings
  def average_rating(team)
    players_ratings = team.players.map do |player|
      player.average_rating
    end
    players_ratings.sum / players_ratings.size
  end

end
