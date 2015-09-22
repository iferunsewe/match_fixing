class Player < ActiveRecord::Base
  attr_accessible :name, :dob, :position, :hometown, :rating_id,
                  :captain, :weight,:height, :password, :email, :remember_me, :team_id,
                  :foot, :specialities, :password_confirmation, :image, :remote_image_url
  before_save :defaults
  mount_uploader :image, PlayerImageUploader


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
    appearances = 0
    Stat.where(player_id: player_id, appearance:true).each do |stat|
      if stat.match.status
        appearances += 1
      end
    end
    appearances
  end

  # Calculates the goals for each player
  def goals(player_id)
    Stat.where(player_id: player_id).sum(:goals)
  end

  def motms(player_id)
    Stat.where(player_id: player_id, man_of_the_match: true).size
  end

  def goals_in_match(player_id, match_id)
    Stat.where(player_id: player_id, match_id: match_id).first.goals
  end

  def motm_in_match(player_id, match_id)
    Stat.where(player_id: player_id, match_id: match_id).first.man_of_the_match ? "Man of the Match" : nil
  end

  def self.map_authentication_to_player_properties(authentication)
    authentication.slice(:info, :provider, :uid)
  end

  def populate_user_fields(auth, user, kind)
    case kind
      when "Facebook"
        facebook_auth_name = [auth["info"]["first_name"], auth["info"]["last_name"]].join(' ')
        user.name = facebook_auth_name if !auth.info.name.nil? && user.name.blank?
        user.email = auth["info"]["email"] if user.email.blank?
        user.image = auth["info"]["image"].gsub("http","https") if user.image.blank?
        user.skip_confirmation! if user.respond_to?(:skip_condirmation!)
    end
    user
  end

  def self.create_player_on_kind(auth, kind)# Created this method because .save was not creating a player id so had to use .create! in this method
    # Needed to create player id as this is what connects the provider to the player
    case kind
      when "Facebook"
        facebook_auth_name = [auth["info"]["first_name"], auth["info"]["last_name"]].join(' ')
        user_name = facebook_auth_name if !auth.info.name.nil?
        user_email = auth["info"]["email"]
        user_image = auth["info"]["image"].gsub("http","https") #Needed or image can not be validated from facebook
        user_password = Devise.friendly_token[0,20]#Password automatically generated for user
        user = self.create!(name: user_name, email: user_email, remote_image_url: user_image, password: user_password)
        self.skip_confirmation! if self.respond_to?(:skip_condirmation!)
    end
    user
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session["devise.authentication"]
        facebook_auth_name = [auth["info"]["first_name"], auth["info"]["last_name"]].join(' ')
        user.name = facebook_auth_name if user.name.blank?
        user.email = auth["info"]["email"] if user.email.blank?
        user.image = auth["info"]["image"] if user.image.blank?
        user.skip_confirmation! if user.respond_to?(:skip_condirmation!)
      end
    end
  end

  def calculate_age(birthday)
    (Date.today - birthday).to_i / 365
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