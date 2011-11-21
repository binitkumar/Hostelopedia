class Room < ActiveRecord::Base
belongs_to :floor
has_many :beds

def vacant_beds
 Bed.find(:all,:conditions=>["room_id=? and student_id is null",self.id])
end
end
