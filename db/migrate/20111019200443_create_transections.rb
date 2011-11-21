class CreateTransections < ActiveRecord::Migration
  def self.up
    create_table :transections do |t|
      t.string :rent_month
      t.string :details
      t.integer :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :transections
  end
end
