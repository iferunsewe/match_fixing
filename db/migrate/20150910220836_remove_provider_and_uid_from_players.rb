class RemoveProviderAndUidFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :provider, :string
    remove_column :players, :uid, :string
  end
end
