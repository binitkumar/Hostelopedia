class Bed < ActiveRecord::Base
belongs_to :room
has_many :students

def available_student
	students.find(:first,:conditions=>["status=?","Continuous"])
end

def under_notice_student
	students.find(:first,:conditions=>["status=?","Vacating"])
end

def not_advance_booked?
	AdvanceBooking.find(:first,:conditions=>["bed_id=?",self.id]).nil?
end

end
