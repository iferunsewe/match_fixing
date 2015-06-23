class Player < ActiveRecord::Base
  attr_accessible :name, :dob, :position, :hometown, :rating_id,
                  :captain, :weight,:height, :password, :email, :remember_me, :team_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :team
  has_many :ratings

  accepts_nested_attributes_for :ratings

  def average_rating
    ratings.sum(:stars) / ratings.size
  end

  # def average_rating(rating)
    # ratings = []
    # ratings << rating
    # total_rating = ratings.inject{|sum, x| sum + x}
    # num_of_ratings = ratings.count
    # average_rating = total_rating / num_of_ratings
  # end

  # def average_rating
  #   player_ratings = Rating.where(player_id: Player.id)
  #   if player_ratings.present?
  #     total_rating = player_ratings.inject{|sum, x| sum + x}
  #     num_of_ratings = player_ratings.count
  #     average_rating = total_rating / num_of_ratings
  #     average_rating
  #   else
  #     'This player has not been rated yet'
  #   end
  # end
end
