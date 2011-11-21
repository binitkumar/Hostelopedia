class HomeController < ApplicationController
layout 'unauthenticated'

def index
	
	if current_user.nil?
			@json = Address.find(:all).to_gmaps4rails
	else
		if !current_user.roles.map(&:name).index('Admin').nil?
			redirect_to '/admin/show'
		elsif !current_user.roles.map(&:name).index('Partner').nil?
			redirect_to '/partners/show'
		elsif !current_user.roles.map(&:name).index('Hostel Owner').nil? || !current_user.roles.map(&:name).index('Hostel Manager').nil? 
			redirect_to '/reminder/days_reminder'
		end
	end
end
end
