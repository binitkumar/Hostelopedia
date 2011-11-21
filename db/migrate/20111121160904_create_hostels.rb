class CreateHostels < ActiveRecord::Migration
  def self.up
    create_table :hostels do |t|
      t.string :name
      t.string :contact_person
      t.string :contact_no

      t.timestamps
    end
  end

  def self.down
    drop_table :hostels
  end
end
