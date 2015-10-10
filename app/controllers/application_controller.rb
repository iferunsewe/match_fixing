class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :user_is_player?, :user_is_admin?, :user_is_captain?, :previous_url
  before_action :configure_permitted_parameters, if: :devise_controller?



  def current_ability
    @current_ability ||= Ability.new(current_player)
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied!"
    redirect_to(previous_url)
  end

  def after_sign_in_path_for(player)
    rater = Rating.where(rater: player.id)
    played_matches = player.matches.where(status: true)
    matches_sorted_by_date = (played_matches.sort_by &:date)
    last_match_played = matches_sorted_by_date.last
    # After log in players will be redirected to the match report for the last match they have played if
    # they haven't made a rating yet and they've played a match/matches or the date of the last rating they made
    # is before the date of the last match they have played. If the player has two unrated matches
    # the second to last match will be discarded as this focuses on the last match played
    if user_is_admin?
      player_path(current_player)
    elsif rater == [] && played_matches == []
      player_path(current_player)
    elsif rater == [] && played_matches.size >= 1
      match_path(last_match_played.id)
    elsif rater != [] && played_matches == []
      player_path(current_player)
    elsif ratings != [] && (ratings.last.created_at < last_match_played.date)
      match_path(last_match_played.id)
    else
      player_path(current_player)
    end
  end

  def update_team_stats
    # Used for calculating the stats for the leadertable
    @teams = Team.all
    @teams.map do |team|
      team.update(played: team.calc_matches(team) ,wins: team.calc_wins(team), losses: team.calc_losses(team), draws: team.calc_draws(team), points: team.calc_points)
    end
    @teams = @teams.order(points: :desc)
  end

  protected

  def previous_url
    session[:my_previous_url] = URI(request.referer || '').path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def user_is_admin?
    !current_player.nil? && current_player.admin
  end

  def user_is_captain?
    !current_player.nil? && current_player.captain
  end

  def authenticate_player!(options={})
    if !current_player
      flash[:alert] = 'You need to sign in before accessing this page!'
      redirect_to new_player_session_path
    end
  end
end
