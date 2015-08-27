class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.boolean :appearance, default: true
      t.integer :goals, default: 0
      t.boolean :man_of_the_match, default: false

      t.references :player, index: true
      t.references :match, index: true
      t.timestamps null: false
    end
  end
end
