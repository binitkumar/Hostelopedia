class PartnersController < ApplicationController
layout 'partner'
before_filter :authenticate_user!, :varify_role
def show
end
def varify_role
	current_user.role_id == 2
end
end
