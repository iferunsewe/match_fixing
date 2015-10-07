class CustomFailure < Devise::FailureApp
  def redirect_url
    root_path
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end

  def recall
      env["PATH_INFO"]  = attempted_path
      flash.now[:alert] = i18n_message(:invalid)
      self.response = recall_app(warden_options[:recall]).call(env)
    end
end