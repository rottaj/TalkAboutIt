class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_user_name(params[:user_name])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.user_id
			redirect_to user_path(user), notice: "Logged in!"
		else
			flash.alert = "Email or password invalid"
			render :new
		end
	end

	def destroy

	end
end