def load_address
row_id = 0
File.open('query.txt','w') { |f|
File.open('full.txt', 'r') do |f1|
	row_id += 1
	while line = f1.gets  
		splitted_section = line.gsub('\n','').split(',')
		#Hostel.create(:name=>"#{splitted_section[0]}",:contact_person$=>"",:contact_no=>"#{splitted_section[splitted_section.length - 1]}" )
		Address.create(:name=>"#{splitted_section[0]}",:contact_person=>"",:contact_no=>"#{splitted_section[splitted_section.length - 1]}",:address_line_one=>"#{splitted_section[1..(splitted_section.length - 4)].to_s}",:street=>"#{splitted_section[splitted_section.length - 3]}",:city=>"#{splitted_section[splitted_section.length - 2]}" )
	end
end 
}
end
