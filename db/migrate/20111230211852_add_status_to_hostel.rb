class AddStatusToHostel < ActiveRecord::Migration
  def self.up
    add_column :hostels, :status, :string
  end

  def self.down
    remove_column :hostels, :status
  end
end
