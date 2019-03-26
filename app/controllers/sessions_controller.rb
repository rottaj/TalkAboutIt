class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(user_name: params[:user_name])

        if user && user.authenticate(params[:password])
            redirect_to user_path(user)
        else 
            render "new"
        end
    end

    def destroy 

    end

end

