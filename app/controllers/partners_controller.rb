class PartnersController < ApplicationController
layout 'partner'
before_filter :authenticate_user!, :varify_role
def show
end
def varify_role
	current_user.role_id == 2
end
def incomplete_hostels
	location = params[:location].nil? ? "" : params[:location]
	street = params[:street].nil? ? "" : params[:street]
	@addresses = Address.incomplete_search(location,street,params[:page])
end
def edit_registrations
	@hostel = Hostel.find(params[:id].to_i)
end
end
