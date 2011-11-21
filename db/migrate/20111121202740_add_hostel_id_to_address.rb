class AddHostelIdToAddress < ActiveRecord::Migration
  def self.up
    add_column :addresses, :hostel_id, :integer
  end

  def self.down
    remove_column :addresses, :hostel_id
  end
end
