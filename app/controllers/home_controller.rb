class HomeController < ApplicationController
layout 'unauthenticated'

def index
	if current_user.nil?
			@longitude = ""
			@lattitude = ""
			@client_ip = request.remote_ip 
			@location = locateIp(request.remote_ip) if request.remote_ip != '127.0.0.1'
			@location = 'Hyderabad' if @location == '-, -, -' || @location.nil? 
			@longitude = '73.0' if @location == '-, -, -'  || @location.nil?
			@lattitude = '17.0' if @location == '-, -, -'  || @location.nil?
			@location = params[:location] if ! params[:location].nil?
			@street = params[:area].nil? ? "" : params[:area]
			
			@opt = 
			if @location == "Hyderabad"
				@option = "<option value=Hyderabad selected=true>Hyderabad</option><option value=Mumbai>Mumbai</option><option value=Chennai>Chennai</option><option value=Bangalore>Bangalore</option><option value=Kolkata>Kolkata</option><option value=Delhi>Delhi</option>".html_safe
			elsif @location == "Mumbai" || @location == "Navi Mumbai"
				@option = "<option value=Hyderabad>Hyderabad</option><option value=Mumbai selected=true>Mumbai</option><option value=Chennai>Chennai</option><option value=Bangalore>Bangalore</option><option value=Kolkata>Kolkata</option><option value=Delhi>Delhi</option>".html_safe
			elsif @location == "Chennai"
				@option = "<option value=Hyderabad>Hyderabad</option><option value=Mumbai>Mumbai</option><option value=Chennai selected=true>Chennai</option><option value=Bangalore>Bangalore</option><option value=Kolkata>Kolkata</option><option value=Delhi>Delhi</option>".html_safe
			elsif @location == "Bangalore"
				@option = "<option value=Hyderabad>Hyderabad</option><option value=Mumbai>Mumbai</option><option value=Chennai>Chennai</option><option value=Bangalore selected= true>Bangalore</option><option value=Kolkata>Kolkata</option><option value=Delhi>Delhi</option>".html_safe
			elsif @location == "Kolkata"
				@option = "<option value=Hyderabad>Hyderabad</option><option value=Mumbai>Mumbai</option><option value=Chennai>Chennai</option><option value=Bangalore>Bangalore</option><option value=Kolkata selected=true>Kolkata</option><option value=Delhi>Delhi</option>".html_safe
			elsif @location == "Delhi"
				@option = "<option value=Hyderabad>Hyderabad</option><option value=Mumbai>Mumbai</option><option value=Chennai>Chennai</option><option value=Bangalore>Bangalore</option><option value=Kolkata>Kolkata</option><option value=Delhi selected=true>Delhi</option>".html_safe
			end
			@addresses = Address.search(@location,@street,params[:page])
			#hostels = Address.find(:all, :conditions => ['city LIKE ? ', '%'+@location+'%']).sort! { |a,b| a.street <=> b.street }
			#streets = hostels.map(&:street).uniq
			hostels = Address.find_by_sql("SELECT DISTINCT ucase(trim(street) ) as street FROM addresses where city like '%#{@location}%' ")
			streets = hostels.map(&:street).uniq
			streets = streets.sort! { |a,b| a <=> b }
			#@options = "<option value=''>All<option>" if params[:area] != ''
			#@options = "<option value=''>All<option>" if params[:area] == ''
			@options = ""
			streets.each do |strt|
				if strt.upcase.match(@street)
					@options +="<option selected=true>#{strt.strip[0..14].upcase}</option>"
				else
					@options +="<option value= #{strt} >#{strt.strip[0..14].upcase}</option>"
				end
			end
			#@opt = Address.find(:all, :conditions => ['city LIKE ? ', '%'+@location+'%'], :limit=>20).sort! { |a,b| a.street <=> b.street }
	else
		if !current_user.roles.map(&:name).index('Admin').nil?
			redirect_to '/admin/show'
		elsif !current_user.roles.map(&:name).index('Partner').nil?
			redirect_to '/partners/show'
		elsif !current_user.roles.map(&:name).index('Collaborator').nil?
			redirect_to '/collaborators/show' 
		elsif !current_user.roles.map(&:name).index('Hostel Owner').nil? || !current_user.roles.map(&:name).index('Hostel Manager').nil? 
			redirect_to '/reminder/days_reminder'
		end
	end
end

def gmap_view
	@json = Address.find(:all).to_gmaps4rails
end

def update_street
	hostels = Address.find(:all, :conditions => ['city LIKE ? ', '%'+params[:id]+'%']).sort! { |a,b| a.street <=> b.street }
	streets = hostels.map(&:street).uniq
	str = ""
	streets.each do |strt|
		str +="<option>#{strt.strip[0..14]}</option>"
	end
	render :js=>str
end

def locateIp(ip_addr)
	#ip = "123.123.123.123";
	#ip = request.remote_ip
	ips = ip_addr
	url = "http://api.ipinfodb.com/v3/ip-city/?key=34d1c7352e8db46ebbb96b2e1da92b42f53c9600f6bb0c41f66ae7e50ced2ac6&ip="+ip_addr
	puts url
	xml_data = Net::HTTP.get_response(URI.parse(url)).body
	location_info = xml_data.split(';')
	city = location_info[6]
	regionName = location_info[5]
	countryName = location_info[4]
    ipLocation = city #+", "+regionName+", "+countryName
	@longitude = location_info[8]
	@latitude = location_info[7]
    return ipLocation

end
end
