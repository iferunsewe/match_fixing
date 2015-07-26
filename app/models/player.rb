class Player < ActiveRecord::Base
  attr_accessible :name, :dob, :position, :hometown, :rating_id,
                  :captain, :weight,:height, :password, :email, :remember_me, :team_id,
                  :foot, :specialities, :password_confirmation, :appearances, :goals

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :team

  has_many :ratings

  accepts_nested_attributes_for :ratings

  # The method calculates the average stars a player has received so it can be shown on their profile
  def average_rating
    if ratings != []
      ratings.sum(:stars) / ratings.size
    else
      0
    end
  end

  # Decides whether players can rate other players. Conditions are:
  # PlayerA can rate PlayerB once after each match
  def played_and_rated__before(player_a, player_b, match) #Player profile and current player logged in
      current_player_ratings = Rating.where(player_id: player_a.id, rater: player_b.id)
      # Finds any existing ratings corresponding to the player ids and checks if they were before the last played match
      rating_after_match = Rating.where(player_id: player_a.id, rater: player_b.id).where("created_at < ?", match.last.date)
      if current_player_ratings.size < 1 || rating_after_match != []
        true
      else
        false
      end
  end

  def calc_apps(player)
    apps = player.team.matches.size
  end
end
