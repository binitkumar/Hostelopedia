class AddHostelTypeToHostel < ActiveRecord::Migration
  def self.up
    add_column :hostels, :hostel_type, :string
  end

  def self.down
    remove_column :hostels, :hostel_type
  end
end
