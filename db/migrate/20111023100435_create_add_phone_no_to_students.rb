class CreateAddPhoneNoToStudents < ActiveRecord::Migration
  def self.up
    create_table :add_phone_no_to_students do |t|
      t.integer :phone_no

      t.timestamps
    end
  end

  def self.down
    drop_table :add_phone_no_to_students
  end
end
