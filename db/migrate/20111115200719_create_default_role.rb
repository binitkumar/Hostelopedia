class CreateDefaultRole < ActiveRecord::Migration
  def self.up
	Role.create(:name=>'Admin')
	Role.create(:name=>'Partner')
	Role.create(:name=>'Collaborator')
	Role.create(:name=>'Hostel Owner')
	Role.create(:name=>'Hostel Manager')
	Role.create(:name=>'Student')
  end

  def self.down
  end
end
