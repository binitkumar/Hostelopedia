class AddFieldToAddress < ActiveRecord::Migration
  def self.up
    add_column :addresses, :name, :string
    add_column :addresses, :contact_person, :string
    add_column :addresses, :contact_no, :string
  end

  def self.down
    remove_column :addresses, :contact_no
    remove_column :addresses, :contact_person
    remove_column :addresses, :name
  end
end
