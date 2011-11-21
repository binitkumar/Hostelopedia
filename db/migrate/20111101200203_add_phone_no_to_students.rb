class AddPhoneNoToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :phone_no, :bigint
  end

  def self.down
    remove_column :students, :phone_no
  end
end
