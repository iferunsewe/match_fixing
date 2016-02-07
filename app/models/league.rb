class League < ActiveRecord::Base
  attr_accessible :name, :location

  has_many :teams
  has_many :players
  has_many :matches, through: :teams

  validates :name, presence: true
  validates :location, presence: true
end
