class Hostel < ActiveRecord::Base
belongs_to :address
has_many :services
has_attached_file :profile_photo ,:default_url => '/images/missing_building.jpeg'
end
