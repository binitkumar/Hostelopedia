class Address < ActiveRecord::Base
acts_as_gmappable
belongs_to :hostel

def gmaps4rails_address
#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  "#{self.street}, #{self.city},#{self.state}, #{self.country}" 
end

def gmaps4rails_infowindow
	"#{self.hostel.name},#{self.address_line_one},#{self.street}, #{self.city}, #{self.country}<br><a href='/hostel/profile/#{self.hostel.id}'>View profile</a>".html_safe 
end
def full_address
	"#{self.address_line_one},<br>#{self.street},<br> #{self.city},<br>#{self.state}, #{self.country}".html_safe
end

def self.search(location,street,page)
	paginate :per_page => 20,:page => page,
        :conditions => ['city LIKE ? and trim(street) like ?', '%'+location+'%','%'+street+'%'],
		:order =>:street
end

def self.incomplete_search(location,street,page)
	paginate :per_page => 20,:page => page,
        :conditions => ['city LIKE ? and trim(street) like ? and status is null', '%'+location+'%','%'+street+'%'],
		:order =>:street
end
end