class AddPrimaryKitColourAndSeconddaryKitColourToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :primary_colour, :string
    add_column :teams, :secondary_colour, :string
  end
end
