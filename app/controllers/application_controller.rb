class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :user_is_player?, :user_is_admin?, :user_is_captain?
  before_action :configure_permitted_parameters, if: :devise_controller?



  def current_ability
    @current_ability ||= Ability.new(current_player)
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = "Access denied!"
    go_back
  end

  def after_sign_in_path_for(player)
    ratings = Rating.where(rater: player.id)
    matches = player.matches
    matches_sorted_by_date = (matches.sort_by &:date)
    last_match_played = matches_sorted_by_date.last
    # After log in players will be redirected to the match report for the last match they have played if
    # they haven't made a rating yet and they've played a match/matches or the date of the last rating they made
    # is before the date of the last match they have played. If the player has two unrated matches
    # the second to last match will be discarded as this focuses on the last match played
    if ratings == [] && matches == []
      player_path(current_player)
    elsif ratings == [] && matches.size >= 1 && last_match_played.status == true
      match_path(last_match_played.id)
    elsif ratings != [] && (ratings.last.created_at < last_match_played.date) && last_match_played.status == true
      match_path(last_match_played.id)
    else
      player_path(current_player)
    end
  end


  protected

  def go_back #Redirect user to previous page
    redirect_to :back
    rescue ActionController::RedirectBackError
      redirect_to root_path
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def user_is_admin?
    current_player.admin
  end

  def user_is_captain?
    current_player.captain
  end

  def authenticate_player!(options={})
    if !current_player
      flash[:notice] = 'You need to sign in before accessing this page!'
      redirect_to new_player_session_path
    end
  end
end
