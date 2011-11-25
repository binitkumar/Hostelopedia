class RemoveColumnsFromAddress < ActiveRecord::Migration
  def self.up
    remove_column :addresses, :name
    remove_column :addresses, :contact_person
    remove_column :addresses, :contact_no
  end

  def self.down
    add_column :addresses, :contact_no, :string
    add_column :addresses, :contact_person, :string
    add_column :addresses, :name, :string
  end
end
