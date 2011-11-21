class Student < ActiveRecord::Base
 belongs_to :bed
 has_attached_file :profile_photo ,:default_url => '/images/missing.jpeg'

 has_attached_file :document_photo

 def next_payment_date
	Date.strptime( Date.today.strftime('%y,%m').to_s+self.created_at.strftime(',%d').to_s,'%y,%m,%d')
  end
  def is_payment_defaulter?
	renting_month = Date.today.strftime('%B-%Y')
	payment_date = self.created_at.strftime('%d')
	today_date = Date.today.strftime('%d')
	if today_date.to_i >= payment_date.to_i
		month_transection = Transection.find(:all,:conditions=>["user_id=? and rent_month=?",self.id,renting_month.to_s])
		month_transection.size == 0
	else
		return false
	end
  end
end