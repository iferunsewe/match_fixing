module MatchesHelper
  def player_avatar player
    if player.image.present?
      image_tag player.image.thumb.url, :class => "img-circle img-responsive profile-circle"
    else
      # Assuming you have a default.jpg in your assets folder
      image_tag 'logo-sm.jpg', :class => "img-circle img-responsive profile-circle"
    end
  end
end
