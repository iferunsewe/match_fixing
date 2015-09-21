class RemoveKitFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :kit, :string
  end
end
