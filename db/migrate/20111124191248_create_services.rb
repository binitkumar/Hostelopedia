class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.integer :hostel_id
      t.integer :total_seats
      t.integer :vacant_seats
      t.integer :sharing
      t.integer :rent_amount
      t.integer :caution_deposite

      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
