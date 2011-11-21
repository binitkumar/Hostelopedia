class ReminderController < ApplicationController
layout 'standard'
helper :all

before_filter :authenticate_user!
def reminder
	
end
def days_reminder
	@reminder_student = Array.new
	@bed = my_beds
	@bed.each do |bed|
		if ! bed.available_student.nil?
			if bed.available_student.is_payment_defaulter?
				@reminder_student.push bed.available_student
			end
		end	
		if ! bed.under_notice_student.nil?
			if bed.under_notice_student.is_payment_defaulter?
				@reminder_student.push bed.under_notice_student
			end
		end
	end
end

def random_reminder
	@random_rmd = RandomReminder.find(:all,:conditions=>["user_id=?",current_user.id])
end

def add_reminder
		rmd = RandomReminder.new
		rmd.note = params[:reminder_note]
		string = params[:reminder_date]
		rmd.for_date =  Date.strptime(string, "%d/%m/%Y") if !string.empty?
		rmd.user_id = current_user.id
		rmd.save!
		redirect_to :action =>'random_reminder'
end
def delete
	RandomReminder.find(params[:id]).destroy
	redirect_to :action =>'random_reminder'
end
end
