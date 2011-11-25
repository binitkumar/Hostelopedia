def update_contact_no
	hostels = Hostel.find :all
	
	hostels.each do |hst|
		hst.contact_no = hst.contact_no.chomp!
		hst.save
	end
end