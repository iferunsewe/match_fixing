class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :date
      t.boolean :status
      t.integer :team_a_score, default: 0
      t.integer :team_b_score, default: 0
      t.integer :team_a_id
      t.integer :team_b_id
      t.references :ground, index: true

      t.timestamps null: false
    end
  end
end
