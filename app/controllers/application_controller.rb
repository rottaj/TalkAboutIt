class ApplicationController < ActionController::Base



    def authenticate
        if session[:current_user_id] == nil
            redirect_to "/signin"
        # else
    	# 	session[:current_user_id] = @user.id

        end
    end

    


end
