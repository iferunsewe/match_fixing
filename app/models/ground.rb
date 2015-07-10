class Ground < ActiveRecord::Base
  attr_accessible :address, :name, :image, :ground_attributes

  has_many :matches

  accepts_nested_attributes_for :matches
end
