class Player < ActiveRecord::Base
  attr_accessible :name, :dob, :position, :hometown, :rating,
                  :captain, :weight,:height

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :team
end
