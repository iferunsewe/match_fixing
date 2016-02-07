class Ground < ActiveRecord::Base
  attr_accessible :address, :name, :image

  has_many :matches

  accepts_nested_attributes_for :matches

  def address_to_link_address
    self.address.gsub(/\s/, '+')
  end
end
