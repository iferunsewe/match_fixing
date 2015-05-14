class Match < ActiveRecord::Base
  attr_accessible :date, :team_a_score, :team_b_score, :status, :team_a_id, :team_b_id

  belongs_to :team_a, :class_name => :Team
  belongs_to :team_b, :class_name => :Team
  has_one :ground
end
