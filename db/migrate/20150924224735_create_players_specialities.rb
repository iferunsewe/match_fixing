class CreatePlayersSpecialities < ActiveRecord::Migration
  def change
    create_table :players_specialities do |t|
      t.belongs_to :player, index: true
      t.belongs_to :speciality, index: true
    end
  end
end

