class Provider < ActiveRecord::Base
  attr_accessible :provider, :uid, :player_id

  belongs_to :player

  def self.authenticate(auth, player_signed_in=nil, kind)
    if player_signed_in || Provider.find_by_uid(auth.uid)
      player = player_signed_in || self.find_by_uid(auth.uid).player
      unless player.providers.where(provider: auth.provider).first
        create_provider(auth.provider, auth.uid, player.id)
      end
      player.populate_user_fields(auth, player, kind)
      player.save
      player
    else #there is no logged in user or user registered with those fields. lets create one
      player = Player.create_player_on_kind(auth, kind)
      binding.pry
      create_provider(auth.provider, auth.uid, player.id)
      binding.pry
      player
    end
  end

  def self.create_provider(provider, uid, player_id)
    self.create!(provider: provider, uid: uid, player_id: player_id)
  end
end