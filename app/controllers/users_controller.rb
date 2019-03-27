class UsersController < ApplicationController

    def index
        @users = User.all 
    end

    def verify
        @input = params[:input]
    end

    def show 
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.sendMail
        if @user.valid?
            @user.save
            render :verify
        else
            # byebug
            redirect_to new_user_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)

        if @user.save
            redirect_to user_path(@user)
        else
            render :edit 
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:bio, :user_name, :email, :status, :location, :password, :password_confirmation, :input)
    end
end
