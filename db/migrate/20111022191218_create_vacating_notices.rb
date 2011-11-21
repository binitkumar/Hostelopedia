class CreateVacatingNotices < ActiveRecord::Migration
  def self.up
    create_table :vacating_notices do |t|
      t.integer :student_id
      t.integer :roomt_id
      t.date :exit_date

      t.timestamps
    end
  end

  def self.down
    drop_table :vacating_notices
  end
end
