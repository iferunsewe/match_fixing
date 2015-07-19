class Ground < ActiveRecord::Base
  attr_accessible :address, :name, :image

  has_many :matches

  accepts_nested_attributes_for :matches
end
