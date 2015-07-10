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
  def played_and_rated__before(player_a, player_b) #Player profile and current player logged in
      # Finds the matches where they have same team id as the teams of the players A and B and the status is true which has been played
      match = Match.where({team_a_id: [player_a.team.id, player_b.team.id], team_b_id: [player_a.team.id, player_b.team.id], status: true})
      # Finds any existing ratings corresponding to the player ids and checks if they were before the last played match
      rating = Rating.where(player_id: [player_a.id, player_b.id], rater:[player_a.id, player_b.id]).where("created_at < ?", match.last.date)
      if match != [] || (match != [] && rating != [])
        true
      else
        false
      end
  end
end
