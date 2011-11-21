class AddBedIdToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :bed_id, :integer
  end

  def self.down
    remove_column :students, :bed_id
  end
end
