class Rating < ActiveRecord::Base
  attr_accessible :stars, :player_id

  belongs_to :player
  belongs_to :team
end
