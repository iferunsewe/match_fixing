class Players::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    handle_callback "Facebook"
  end

  def handle_callback(kind)
    auth = Player.map_authentication_to_player_properties(request.env["omniauth.auth"])
    @player = Provider.authenticate(auth, current_player, kind)
    if @player.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => kind.titleize
      sign_in_and_redirect @player, :event => :authentication
    else
      session["devise.authentication"] = auth
      redirect_to new_player_registration_url
    end
  end
end