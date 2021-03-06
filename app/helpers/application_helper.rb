module ApplicationHelper
  def resource_name
    :player
  end

  def resource
    @resource ||= Player.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:player]
  end
end
