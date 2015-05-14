class CreateGrounds < ActiveRecord::Migration
  def change
    create_table :grounds do |t|
      t.text :address
      t.text :name
      t.text :image
      t.references :match, index: true

      t.timestamps null: false
    end
  end
end
