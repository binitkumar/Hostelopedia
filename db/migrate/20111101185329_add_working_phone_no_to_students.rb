class AddWorkingPhoneNoToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :work_phone_no, :bigint
  end

  def self.down
    remove_column :students, :work_phone_no
  end
end
