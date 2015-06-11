class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :hometown
      t.string :wins
      t.string :losses
      t.string :draws
      t.integer :rating_id
      t.boolean :seeking_players

      t.timestamps null: false
    end
  end
end
