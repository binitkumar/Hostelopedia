class AddTypeToTransection < ActiveRecord::Migration
  def self.up
    add_column :transections, :type, :string
  end

  def self.down
    remove_column :transections, :type
  end
end
