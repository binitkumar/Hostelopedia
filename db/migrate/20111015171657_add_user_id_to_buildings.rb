class AddUserIdToBuildings < ActiveRecord::Migration
  def self.up
    add_column :buildings, :user_id, :integer
  end

  def self.down
    remove_column :buildings, :user_id
  end
end
