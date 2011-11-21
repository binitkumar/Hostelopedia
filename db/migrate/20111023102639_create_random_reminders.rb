class CreateRandomReminders < ActiveRecord::Migration
  def self.up
    create_table :random_reminders do |t|
      t.date :for_date
      t.text :note
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :random_reminders
  end
end
