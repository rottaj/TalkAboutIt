class SessionsController < ApplicationController

    def new
        reset_session
    end
    
    def create
        @user = User.find_by_user_name(params[:user_name])

        if @user && @user.authenticate(params[:password])
            session[:current_user_id] = @user.id
            #byebug
            redirect_to user_path(@user)
        else 
            render "new"
        end
    end
end

