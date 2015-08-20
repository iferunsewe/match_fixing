class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :hometown
      t.integer :played, default: 0
      t.integer :wins, default: 0
      t.integer :losses, default: 0
      t.integer :draws, default: 0
      t.integer :points, default: 0
      t.integer :rating_id
      t.boolean :seeking_players
      t.references :league, index: true

      t.timestamps null: false
    end
  end
end
