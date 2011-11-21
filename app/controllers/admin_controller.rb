class AdminController < ApplicationController
layout 'admin'
before_filter :authenticate_user!
def show
end
def add_user
begin
usr = User.new
usr.email = params[:email]
usr.password = params[:password]
usr.role_id = params[:role_id].to_i
usr.save!
flash[:message] = "User added successfully."
redirect_to '/admin/new_user'
rescue Exception =>exp
	flash[:message]= "Unable to save message due to " + exp
	redirect_to '/admin/new_user'
end

end
end
