class Floor < ActiveRecord::Base
belongs_to :building
has_many :rooms
end
