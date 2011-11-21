class RemoveTypeFromTransection < ActiveRecord::Migration
  def self.up
    remove_column :transections, :type
  end

  def self.down
    add_column :transections, :type, :string
  end
end
