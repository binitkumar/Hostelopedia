class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :name
      t.string :qualification
      t.string :purpose_of_visit
      t.string :permanent_address
      t.integer :monthly_rent
      t.integer :advance_amount
      t.string :comment
      t.boolean :flag

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
