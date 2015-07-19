class AddColumnsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :foot, :string
    add_column :players, :specialities, :string
  end
end
