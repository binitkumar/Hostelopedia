class CreateContactUs < ActiveRecord::Migration
  def self.up
    create_table :contact_us do |t|
      t.string :email
      t.string :message

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_us
  end
end
