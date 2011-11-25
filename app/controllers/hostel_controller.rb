class HostelController < ApplicationController
  layout 'unauthenticated'
  def profile
	@hostel = Hostel.find params[:id].to_i if params[:id].to_i != 0
  end
end
