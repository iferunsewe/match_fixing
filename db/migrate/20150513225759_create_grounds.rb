class CreateGrounds < ActiveRecord::Migration
  def change
    create_table :grounds do |t|
      t.string :name
      t.text :address
      t.text :image
      t.references :match, index: true

      t.timestamps null: false
    end
  end
end
