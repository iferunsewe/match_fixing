class Team < ActiveRecord::Base
  attr_accessible :name, :hometown, :wins, :losses, :draws, :rating, :seeking_players

  has_many(:matches, :foreign_key => :team_a_id, :dependent => :destroy)
  has_many(:reverse_team_match, :class_name => :Match, :foreign_key => :team_b_id, :dependent => :destroy)
  has_many :teams, :through => :matches, :source => :team_b
  has_many :players
end
