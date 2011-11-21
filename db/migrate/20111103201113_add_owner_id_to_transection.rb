class AddOwnerIdToTransection < ActiveRecord::Migration
  def self.up
    add_column :transections, :owner_id, :integer
  end

  def self.down
    remove_column :transections, :owner_id
  end
end
