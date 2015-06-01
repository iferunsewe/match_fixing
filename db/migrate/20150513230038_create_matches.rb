class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :date
      t.boolean :status
      t.integer :team_a_score
      t.integer :team_b_score
      t.integer :team_a_id
      t.integer :team_b_id


      t.timestamps null: false
    end
  end
end
