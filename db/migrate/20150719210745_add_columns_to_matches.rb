class AddColumnsToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :man_of_the_match, :string
  end
end
