class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :line_one
      t.string :street
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
