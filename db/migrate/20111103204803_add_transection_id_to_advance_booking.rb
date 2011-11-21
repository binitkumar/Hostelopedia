class AddTransectionIdToAdvanceBooking < ActiveRecord::Migration
  def self.up
    add_column :advance_bookings, :transection_id, :integer
  end

  def self.down
    remove_column :advance_bookings, :transection_id
  end
end
