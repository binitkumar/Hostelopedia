class CreateAdvanceBookings < ActiveRecord::Migration
  def self.up
    create_table :advance_bookings do |t|
      t.integer :bed_id
      t.integer :amount
      t.date :allocation_on

      t.timestamps
    end
  end

  def self.down
    drop_table :advance_bookings
  end
end
