class StudentdetailController < ApplicationController
layout 'standard' ,:except=>[:generate_id_card]
before_filter :authenticate_user!
def detail
	@student = Student.find_by_id(params[:id])
	@transections = Transection.find(:all, :conditions=>["user_id=?", @student.id ] )
end
def add_new
	@student = Student.new
end
def adding_student
	@stud = Student.new
	@stud.name = params[:student][:name]
	@stud.monthly_rent = params[:student][:monthly_rent]
	@stud.comment = params[:student][:comment]
	@stud.advance_amount = params[:student][:advance_amount]
	@stud.flag = params[:student][:flag]
	@stud.qualification = params[:student][:qualification]
	@stud.permanent_address = params[:student][:permanent_address]
	@stud.phone_no = params[:student][:phone_no]
	@stud.email = params[:student][:email]
	@stud.work_phone_no = params[:student][:work_phone_no]
	@stud.purpose_of_visit = params[:student][:purpose_of_visit]
	@stud.profile_photo = params[:student][:profile_photo]
	@stud.document_photo = params[:student][:document_photo]
	@stud.bed_id = params[:student][:bed_id].to_i
	@stud.status = 'Continuous'
	@stud.save!
	@stud.created_at = Date.strptime(params[:join_date],'%d/%m/%Y')
	@stud.save!
	assigned_bed = Bed.find_by_id(params[:student][:bed_id].to_i)
	assigned_bed.student_id = @stud.id
	assigned_bed.save
	booking = AdvanceBooking.find(:first,:conditions=>["bed_id=?",assigned_bed.id])
	if !booking.nil?
		prev_trans = booking.transection
		prev_trans.user_id = @stud.id
		prev_trans.save!
	end
	booking.destroy if ! booking.nil?
	trans = Transection.new
	trans.user_id = @stud.id
	trans.details = "Advance amount"
	trans.amount = @stud.advance_amount.to_i
	trans.mode='Income'
	trans.rent_month = ""
	trans.owner_id = current_user.id
	trans.save!
	trans = Transection.new
	trans.user_id = @stud.id
	trans.details = "Rent deposite of month :" + @stud.created_at.strftime('%B-%Y') 
	trans.amount = @stud.monthly_rent
	trans.rent_month = @stud.created_at.strftime('%B-%Y')
	trans.mode='Income'
	trans.owner_id = current_user.id
	trans.save!
	redirect_to :action=>'detail', :id=>@stud.id
end
def attach_doc
	@stud = Student.find(params[:id].to_i)
end
def search
	
end
def search_result
	@stud = Student.find_by_sql("select * from students where soundex(name) = soundex('#{params[:student_name]}')" )
end
def action
	action = params[:student_action]
	if action.to_i == 1
		redirect_to :action=>'generate_id_card',:id=>params[:student_id]
	elsif action.to_i == 2
		amount = params[:rent]
		month = params[:month]+"-"+params[:year]
		trans = Transection.new
		trans.amount = amount
		trans.owner_id = current_user.id
		trans.rent_month = month
		trans.mode='Income'
		trans.user_id = params[:student_id]
		trans.details = "Rent deposite of month :" + month
		trans.save!
		redirect_to :action=>'detail', :id=>params[:student_id]
	elsif action.to_i == 3
		vacatng_notice = VacatingNotice.new
		student  = Student.find(params[:student_id]) ;
		vacatng_notice.student_id = params[:student_id]
		vacatng_notice.bed_id = student.bed.id
		vacatng_notice.roomt_id = student.bed.room.id
		string = params[:vacating_date]
		vacatng_notice.exit_date = Date.strptime(string, "%d/%m/%Y")
		vacatng_notice.save!
		student.status="Vacating"
		student.save!
		redirect_to :action=>'detail', :id=>params[:student_id]
	elsif action.to_i == 4
		student  = Student.find(params[:student_id]) ;
		bed = student.bed
		bed.student_id = nil
		bed.save!
		student.bed_id = params[:bed]
		student.save!
		bed = Bed.find(params[:bed].to_i)
		bed.student_id =student.id
		bed.save!
		redirect_to :action=>'detail', :id=>params[:student_id]
	elsif action.to_i == 5
		student  = Student.find(params[:student_id]) 
		student.status = 'Vacated'
		student.leaving_date = Date.today
		bed = student.bed
		bed.student_id = nil
		bed.save!
		student.bed_id = nil 
		student.save!
		
		redirect_to :action=>'vacate_room', :id=>params[:student_id]
	end
end
def vacate_room
	@student = Student.find(params[:id].to_i)
	start_date = @student.created_at
	transection_amount = Transection.find_by_sql("select sum(amount) as total from transections where user_id=#{@student.id} and mode='Income' and rent_month !='' ")
	spend_time_in_sec = Time.now.to_i - @student.created_at.to_i
	spend_time_in_month= spend_time_in_sec/(24*60*60)
	amount_to_be_paid = ""
	@total_amount = transection_amount[0].total.to_i + @student.advance_amount.to_i
	@refunding_amount = ""
	@transections = Transection.find(:all, :conditions=>["user_id=?", @student.id ] )
end
def flag
	student = Student.find(params[:id].to_i)
	if student.flag == true
		student.flag = false
	else
		student.flag = true
	end
	student.save!
	redirect_to :action=>'detail',:id=>params[:id]
end
def generate_id_card
	@student= Student.find(params[:id])
end
end
