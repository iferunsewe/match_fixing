class Stat < ActiveRecord::Base
  attr_accessible :goals, :appearance, :man_of_the_match, :player_id, :match_id, :player_attributes, :match_attributes

  belongs_to :player
  belongs_to :match

  accepts_nested_attributes_for :match, :player
end
