class ApplicationController < ActionController::Base

	def authenticate
		if (session[:current_user_id] == nil || User.find(session[:current_user_id]) == nil)
			redirect_to '/'
		end
	end
end
