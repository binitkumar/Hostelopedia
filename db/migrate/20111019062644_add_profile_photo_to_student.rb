class AddProfilePhotoToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :profile_photo_file_name, :string
    add_column :students, :profile_photo_content_type, :string
    add_column :students, :profile_photo_size, :integer
  end

  def self.down
    remove_column :students, :profile_photo_size
    remove_column :students, :profile_photo_content_type
    remove_column :students, :profile_photo_file_name
  end
end
