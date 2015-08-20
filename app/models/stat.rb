class Stat < ActiveRecord::Base
  attr_accessible :goals, :appearance, :man_of_the_match, :player_id, :match_id


  def player_appearances
    Stat.where(appearance: true).size
  end

  def player_motms
    Stat.where(man_of_the_match: true).size
  end

  def player_goals
    Stat.sum(:goals)
  end

  belongs_to :player
  belongs_to :match
end
