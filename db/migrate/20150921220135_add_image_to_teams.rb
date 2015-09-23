class AddImageToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :image, :text
  end
end
