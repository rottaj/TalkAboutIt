class SessionsController < ApplicationController

    def new

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

    def destroy
        reset_session
        # byebug
        redirect_to '/signin?'
    end
end

