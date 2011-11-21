class RemovePhoneNoFromStudents < ActiveRecord::Migration
  def self.up
    remove_column :students, :phone_no
  end

  def self.down
    add_column :students, :phone_no, :integer
  end
end
