class HostelController < ApplicationController
  layout 'unauthenticated'
  def profile
	@hostel = Hostel.find params[:id].to_i if params[:id].to_i != 0
  end
  
  def contact_us
	@contact = ContactUs.new
  end
  def save_contact
	@contact = params[:contact_us]
	ContactUs.create(:email=>@contact[:email],:message=>@contact[:message])
	redirect_to '/'
  end
  def suggestion
	hostel_name = params[:hostel_name]
	hostel_address_line_one = params[:address_line_one]
	hostel_address_street   = params[:street]
	hostel_address_city     = params[:city]
	hostel_address_state    = params[:state]
	hostel_address_country  = params[:country]
	hostel_contact_name     = params[:contact_person]
	hostel_contact_no       = params[:contact_no]
	hostel_type             = params[:hostel_type]
	hostel_food_service     = params[:food_service]
	hostel_notes            = params[:hostel_notes]
	hostel_rating           = params[:standard_level]
	service_count           = params[:service_count]
	
	hostel = Hostel.new
	hostel.name= hostel_name
	hostel.contact_person = hostel_contact_name
	hostel.contact_no     = hostel_contact_no
	hostel.hostel_type    = hostel_type
	hostel.food_service   = hostel.food_service
	hostel.standard_level = hostel.standard_level
	hostel.profile_photo  = params[:hostel_photo]
	hostel.varification_status = 'Not Varified'
	hostel.save
	
	
	service_array = Array.new
	(service_count.to_i + 1).times do |count|
		service = Service.new
		total = params[('total'+(count).to_s).to_sym]
		vacant= params[('vacant'+(count).to_s).to_sym]
		sharing=params[('sharing'+(count).to_s).to_sym]
		rent   =params[('rent'+(count).to_s).to_sym]
		caution=params[('deposite'+(count).to_s).to_sym]
		service.total_seats = total
		service.vacant_seats= vacant
		service.sharing     = sharing
		service.rent_amount = rent
		service.caution_deposite = caution
		service.hostel_id = hostel.id
		service.save
		service_array.push service
	end
	addr = Address.new
	addr.hostel_id = hostel.id
	addr.address_line_one = hostel_address_line_one
	addr.street   = hostel_address_street
	addr.city     = hostel_address_city
	addr.state    = hostel_address_state
	addr.country  = hostel_address_country
	addr.save
	
	hostel.address = addr
	hostel.save
	
	flash[:message] = "Suggestion send to administrator successfully."
	redirect_to '/hostel/suggest_hostel'
  end
  
  def edit_hostel
	hostel_id = params[:hostel_id].to_i
	
	hostel_name = params[:hostel_name]
	hostel_address_line_one = params[:address_line_one]
	hostel_address_street   = params[:street]
	hostel_address_city     = params[:city]
	hostel_address_state    = params[:state]
	hostel_address_country  = params[:country]
	hostel_contact_name     = params[:contact_person]
	hostel_contact_no       = params[:contact_no]
	hostel_type             = params[:hostel_type]
	hostel_food_service     = params[:food_service]
	hostel_notes            = params[:hostel_notes]
	hostel_rating           = params[:standard_level]
	service_count           = params[:service_count]
	
	hostel = Hostel.find(hostel_id)
	hostel.name= hostel_name
	hostel.contact_person = hostel_contact_name
	hostel.contact_no     = hostel_contact_no
	hostel.hostel_type    = hostel_type
	hostel.food_service   = hostel.food_service
	hostel.standard_level = hostel.standard_level
	hostel.profile_photo  = params[:hostel_photo]
	hostel.varification_status = 'Not Varified'
	hostel.save
	
	services = hostel.services
	services.delete_all
	puts "###################{service_count}##############################"
	(service_count.to_i).times do |count|
		service = Service.new
		total = params[('total'+(count).to_s).to_sym]
		vacant= params[('vacant'+(count).to_s).to_sym]
		sharing=params[('sharing'+(count).to_s).to_sym]
		rent   =params[('rent'+(count).to_s).to_sym]
		caution=params[('deposite'+(count).to_s).to_sym]
		service.total_seats = total
		service.vacant_seats= vacant
		service.sharing     = sharing
		service.rent_amount = rent
		service.caution_deposite = caution
		service.hostel_id = hostel.id
		service.save
		puts service.inspect
	end
	addr = hostel.address
	addr.address_line_one = hostel_address_line_one
	addr.street   = hostel_address_street
	addr.city     = hostel_address_city
	addr.state    = hostel_address_state
	addr.country  = hostel_address_country
	addr.save
	
	hostel.address = addr
	hostel.save
	
	flash[:message] = "Hostel information modified successfully."
	redirect_to '/partners/edit_registrations/' + hostel.id.to_s
  end 
 end
