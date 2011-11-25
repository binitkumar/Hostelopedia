class AddFieldToHostel < ActiveRecord::Migration
  def self.up
	add_column :hostels, :profile_photo_file_name, :string
	add_column :hostels, :profile_photo_content_type, :string
	add_column :hostels, :profile_photo_file_size, :integer
	add_column :hostels, :profile_photo_updated_at, :datetime
  end

  def self.down
  end
end
