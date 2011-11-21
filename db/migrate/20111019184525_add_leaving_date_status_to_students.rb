class AddLeavingDateStatusToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :leaving_date, :date
    add_column :students, :status, :string
  end

  def self.down
    remove_column :students, :status
    remove_column :students, :leaving_date
  end
end
