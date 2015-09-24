class RemoveSpecialitiesFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :specialities, :string
  end
end
