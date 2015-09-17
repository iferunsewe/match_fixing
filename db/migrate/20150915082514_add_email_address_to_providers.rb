class AddEmailAddressToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :email_address, :string
  end
end
