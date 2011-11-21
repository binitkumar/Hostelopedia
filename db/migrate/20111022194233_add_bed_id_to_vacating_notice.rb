class AddBedIdToVacatingNotice < ActiveRecord::Migration
  def self.up
    add_column :vacating_notices, :bed_id, :integer
  end

  def self.down
    remove_column :vacating_notices, :bed_id
  end
end
