class League < ActiveRecord::Base
  attr_accessible :name, :location

  has_many :teams
end
