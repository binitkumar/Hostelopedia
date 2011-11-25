class CreateHostels < ActiveRecord::Migration
  def self.up
    create_table :hostels do |t|
      t.string :name
      t.string :contact_person
      t.string :contact_no
      t.integer :address_id
      t.string :food_service
      t.float :standard_level
      t.text :notes
      t.integer :representative_id
      t.date :data_collection_date
      t.string :varification_status

      t.timestamps
    end
  end

  def self.down
    drop_table :hostels
  end
end
