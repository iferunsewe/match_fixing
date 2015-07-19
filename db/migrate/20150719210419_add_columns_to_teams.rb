class AddColumnsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :philosophy, :string
    add_column :teams, :kit, :string
  end
end
