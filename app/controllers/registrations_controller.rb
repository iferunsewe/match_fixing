class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def after_sign_up_path_for(resource)
    edit_player_path(current_player)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name)
    devise_parameter_sanitizer.for(:account_update).push(:name)
  end
end