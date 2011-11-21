class AddAddressIdToHostel < ActiveRecord::Migration
  def self.up
    add_column :hostels, :address_id, :integer
  end

  def self.down
    remove_column :hostels, :address_id
  end
end
