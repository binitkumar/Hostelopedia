class LoginController < ApplicationController
before_filter :authenticate_user!
def varify
	redirect_to '/building/list'
end
def logout
	
end
end
