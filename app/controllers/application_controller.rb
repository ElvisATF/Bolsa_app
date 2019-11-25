class ApplicationController < ActionController::Base
	
	include SessionsHelper

	private
# Confirms a logged-in user.
	def logged_in_entity
		unless logged_in?
		store_location
		redirect_to newsession_url
		end
	end

end
