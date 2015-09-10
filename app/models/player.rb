class Player < ActiveRecord::Base
  attr_accessible :name, :dob, :position, :hometown, :rating_id,
                  :captain, :weight,:height, :password, :email, :remember_me, :team_id,
                  :foot, :specialities, :password_confirmation
  before_save :defaults


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  belongs_to :team
  has_many :ratings
  has_many :stats
  has_many :matches, through: :stats
  has_many :providers, dependent: :destroy

  accepts_nested_attributes_for :ratings, :matches, :stats

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
      match = match.sort_by &:date
      rating_after_match = Rating.where(player_id: player_a.id, rater: player_b.id).where("created_at < ?", match.last.date)
      if current_player_ratings.size < 1 || rating_after_match != []
        true
      else
        false
      end
  end

  # Calculates the appearances for each player
  def appearances(player_id)
    Stat.where(player_id: player_id, appearance:true).size
  end

  # Calculates the goals for each player
  def goals(player_id)
    Stat.where(player_id: player_id).sum(:goals)
  end

  def motms(player_id)
    Stat.where(player_id: player_id, man_of_the_match: true).size
  end

  def self.map_authentication_to_player_properties(authentication)
    authentication.slice(:info, :provider, :uid, :user_id)
  end

  def populate_user_fields(auth, user, kind)
    case kind
      when "Facebook"
        user.name = auth.info.name if !auth.info.name.nil? && user.name.blank?
        user.image = auth.info.image if user.image.blank?
    end
    user
  end

  def self.find_for_facebook_oauth(auth, signed_in_user=nil)
    if user = signed_in_user || User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name if user.name.blank?
      user.image = auth.info.image if user.image.blank?
      user.save
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.image = auth.info.image
        user.password = Devise.friendly_token[0,20]
        user.skip_confirmation! # don't require email confirmation
      end
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session["devise.authentication"]
        user.name = auth["info"]["first_name"] if user.name.blank?
        user.email = auth["info"]["email"] if user.email.blank?
        user.image = auth["info"]["image"] if user.image.blank?
        user.skip_confirmation! if user.respond_to?(:skip_condirmation!)
      end
    end
  end



  private

  # Sets the default role for each user. Had to it here instead of migration because otherwise it couldn't be overriden by seed data
  def defaults
    if self.name == "Alex Ames" || self.name == "Ife Runsewe"
      self.admin ||= true
    else
      self.admin ||= false
      nil #^Leaving a false value on the stack means the model will not be saved.^
    end
  end
end
