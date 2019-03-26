class ApplicationController < ActionController::Base

	#before_action :authenticate

	def authenticate
		if (session[:current_user_id] == nil || User.find(session[:current_user_id]) == nil)
			redirect_to '/'
		end
	end
end
