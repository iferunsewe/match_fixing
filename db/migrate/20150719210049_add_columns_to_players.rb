class AddColumnsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :foot, :string
    add_column :players, :specialities, :string
    add_column :players, :admin, :boolean
  end
end
