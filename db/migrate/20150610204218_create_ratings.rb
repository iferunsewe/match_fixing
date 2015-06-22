class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :player, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.integer :stars, default: 0


      t.timestamps null: false
    end
  end
end
