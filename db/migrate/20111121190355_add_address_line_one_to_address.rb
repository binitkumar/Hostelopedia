class AddAddressLineOneToAddress < ActiveRecord::Migration
  def self.up
    add_column :addresses, :address_line_one, :string
  end

  def self.down
    remove_column :addresses, :address_line_one
  end
end
