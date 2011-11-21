class AddModeToTransection < ActiveRecord::Migration
  def self.up
    add_column :transections, :mode, :string
  end

  def self.down
    remove_column :transections, :mode
  end
end
