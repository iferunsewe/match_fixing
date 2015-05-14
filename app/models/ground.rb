class Ground < ActiveRecord::Base
  attr_accessible :address, :name, :image

  belongs_to :match
end
