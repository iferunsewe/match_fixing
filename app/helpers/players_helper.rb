module PlayersHelper
  def navbar_avatar object
    if object.image.present?
      image_tag object.image.thumb.url :class => "img-responsive navbar-images"
    elsif object.class.name == 'Player'
      # Assuming you have a default.jpg in your assets folder
      image_tag 'homepage-profile.png', :class => "img-responsive navbar-images"
    else
      image_tag 'homepage_team.png', :class => "img-responsive navbar-images"
    end
  end
end
