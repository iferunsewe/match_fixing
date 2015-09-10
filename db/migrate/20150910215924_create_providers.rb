class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer :player_id
      t.string :provider
      t.string :uid

      t.timestamp
    end
  end
end
