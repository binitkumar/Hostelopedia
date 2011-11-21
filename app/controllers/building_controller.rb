class BuildingController < ApplicationController
before_filter :authenticate_user!, :varify_role
	layout 'standard'
	def navigator
		url = '/building/detail/'+params[:building_id]
		redirect_to url
	end
	def list
		@building = my_buildings
	end
	def detail
		@floor = Floor.find(:all,:conditions=>["building_id=?",params[:id] ])
		@total = 0
		@current_count = 0
		@building = Building.find(:first,:conditions=>["id=?",params[:id] ])
			@building.floors.each do |flr|
				flr.rooms.each do |rom|
					rom.beds.each do | bd |
						if ! bd.available_student.nil? or ! bd.under_notice_student.nil?
								@current_count = @current_count + 1
						end
						@total = @total+ 1
					end
				end
			end
	end
	def editor
		@floor = Floor.find(:all,:conditions=>["building_id=?",params[:id] ])
		@total = 0
		@current_count = 0
		@building = Building.find(:first,:conditions=>["id=?",params[:id] ])
			@building.floors.each do |flr|
				flr.rooms.each do |rom|
					rom.beds.each do | bd |
						if ! bd.available_student.nil? or ! bd.under_notice_student.nil?
								@current_count = @current_count + 1
						end
						@total = @total+ 1
					end
				end
			end
	end
	def add_new
	end
	def add
		build = Building.new
		build.name = params[:building_name]
		build.address = params[:building_address]
		build.security_guard = params[:building_security_guard]
		build.user_id = current_user.id
		build.save
		flash[:message] = "Building added successfully."
		redirect_to :action=>'list'
	end
	def json_resp

		a ="Hello Json"
		render :json=>a.to_json
	end
	def add_floor
	end
	def adding_floor
		floor = Floor.new
		floor.name = params[:floor_name]
		floor.building_id = params[:building_id]
		floor.save
		flash[:message] = "Floor added successfully."
		redirect_to :action=>'editor', :id=>floor.building.id
	end
	def add_room
		@floor = Floor.find(params[:id].to_i )
	end
	def adding_room
		room = Room.new
		room.name = params[:room_name]
		room.floor_id = params[:floor_id]
		room.save
		flash[:message] = "Room added successfully."
		redirect_to :action=>'editor' ,:id=>room.floor.building.id
	end
	def add_bed
		@room = Room.find(params[:room_id]);
	end
	def adding_bed
		bed = Bed.new
		bed.position = params[:bed_name]
		bed.room_id = params[:room_id]
		bed.save
		flash[:message] = "Bed added successfully."
		redirect_to :action=>'editor' ,:id=>bed.room.floor.building.id
	end
	def edit
		@building = my_buildings
	end
	def change_owner
	end
	def modify_owner
		bld = Building.find(params[:building_id])
		bld.user_id = params[:new_owner_id]
		bld.save!
		redirect_to :action=>'list'
	end
	def varify_role
		if !(current_user.role_id == 3 || current_user.role_id == 4)
			redirect_to '/'
		end
	end
end
