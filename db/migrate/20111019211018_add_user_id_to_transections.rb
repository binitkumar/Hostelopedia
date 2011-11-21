class AddUserIdToTransections < ActiveRecord::Migration
  def self.up
    add_column :transections, :user_id, :integer
  end

  def self.down
    remove_column :transections, :user_id
  end
end
