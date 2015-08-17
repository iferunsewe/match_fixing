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
