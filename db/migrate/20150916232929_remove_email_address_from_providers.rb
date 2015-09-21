class RemoveEmailAddressFromProviders < ActiveRecord::Migration
  def change
    remove_column :providers, :email_address, :string
  end
end
