class AddColumnsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :foot, :string
    add_column :players, :specialities, :string
    add_column :players, :goals, :integer, default: 0
    add_column :players, :appearances, :integer, default: 0
  end
end
