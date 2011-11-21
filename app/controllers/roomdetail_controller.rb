class RoomdetailController < ApplicationController
before_filter :authenticate_user!
layout 'standard'
def detail
end
def search
	@build = Building.find(:all,:conditions=>["user_id=?",current_user.id])
end
def search_result
	if params[:room_id].nil?
	@rm = Room.find(params[:id])
	else
	@rm = Room.find(params[:room_id])
	end
end
def advance_booking
end
def advance_book_room
	adv = AdvanceBooking.new
	adv.bed_id = params[:bed_id]
	adv.amount = params[:amount]
	trans = Transection.new
	trans.user_id = nil
	trans.details = "Advance amount"
	trans.amount = adv.amount
	trans.rent_month = ""
	trans.owner_id = current_user.id
	trans.save!
	adv.transection_id = trans.id
	adv.save!
	redirect_to :action => 'vacancy_search'
end
def vacancy_search
	@filter = params[:filter].nil? ? 1 : params[:filter].to_i 
end
end
