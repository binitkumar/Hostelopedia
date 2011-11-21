module ApplicationHelper
 def my_buildings
	Building.find(:all,:conditions=>["user_id=?",current_user.id])
  end
  
  def my_floors
	floor = Array.new
	my_buildings.each do |bld|
		bld.floors.each do |flr|
			floor.push flr
		end
	end
	floor
  end
  
  def my_rooms
	room = Array.new
	my_floors.each do |flr|
		flr.rooms.each do |rm|
			room.push rm
		end
	end
	room
  end
  
  def my_beds
	bed = Array.new
	my_rooms.each do |rm|
		rm.beds.each do |bd|
			bed.push bd
		end
	end
	bed
  end
def csrf_meta_tag
    if protect_against_forgery?
      out = %(<meta name="csrf-param" content="%s"/>\n)
      out << %(<meta name="csrf-token" content="%s"/>)
      out % [ Rack::Utils.escape_html(request_forgery_protection_token),
              Rack::Utils.escape_html(form_authenticity_token) ]
    end
  end

 
  
end
