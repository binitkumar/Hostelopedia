class AddStudentIdToBed < ActiveRecord::Migration
  def self.up
    add_column :beds, :student_id, :integer
  end

  def self.down
    remove_column :beds, :student_id
  end
end
