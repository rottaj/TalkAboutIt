class ApplicationController < ActionController::Base

    before_action :authenticate

    def authenticate
        if session[:current_user_id] == nil
            redirect_to "/signin"
        end
    end


end
