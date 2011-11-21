class TransectionController < ApplicationController
before_filter :authenticate_user!
layout 'standard'
def list
	start_date = params[:start_date].nil? ? "" : params[:start_date]
	end_date = params[:end_date].nil? ? "" : params[:end_date]
	
	start_d = !start_date.empty? ? Date.strptime(start_date,'%d/%m/%Y') : Date.today 
	end_d =   !end_date.empty? ? Date.strptime(end_date,'%d/%m/%Y') : Date.today + 1.day
	@transections = Transection.find(:all,:conditions=>["owner_id=? and created_at >= ? and created_at <= ?",current_user.id,start_d,end_d])
end
def payment
	start_date = params[:start_date].nil? ? "" : params[:start_date]
	end_date = params[:end_date].nil? ? "" : params[:end_date]
	
	start_d = !start_date.empty? ? Date.strptime(start_date,'%d/%m/%Y') : Date.today 
	end_d =   !end_date.empty? ? Date.strptime(end_date,'%d/%m/%Y') : Date.today + 1.day
	@transections = Transection.find(:all,:conditions=>["owner_id=? and mode=? and created_at >= ? and created_at <= ?",current_user.id,'Payment',start_d,end_d])
end
def income
	start_date = params[:start_date].nil? ? "" : params[:start_date]
	end_date = params[:end_date].nil? ? "" : params[:end_date]
	
	start_d = !start_date.empty? ? Date.strptime(start_date,'%d/%m/%Y') : Date.today 
	end_d =   !end_date.empty? ? Date.strptime(end_date,'%d/%m/%Y') : Date.today + 1.day
	@transections = Transection.find(:all,:conditions=>["owner_id=? and mode=? and created_at >= ? and created_at <= ?",current_user.id,'Income',start_d,end_d])
end
end
