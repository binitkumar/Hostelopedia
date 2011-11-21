class Transection < ActiveRecord::Base
attr_accessible :created_at
def student
	Student.find(self.user_id)
end
end
