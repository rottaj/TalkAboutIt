class UsersController < ApplicationController
    
    before_action :authenticate
    skip_before_action :authenticate, only: [:new, :create, :verify]

   
    def verify
        #@user = User.find(params[:id])
        $input = params[:input]
        if $user.verification_code == $input
            $user.verification_code = "True"
            $user.save
            flash[:notice] = "Email Verified!"
            redirect_to "/signin"
        else
            render :verify
            flash[:notice] = "Wrong Verification Code!"
        end
    end

    def index
        @users = User.all
    end

    def show 
        @user = User.find(session[:current_user_id])
    end

    def new
        @user = User.new
    end

    def create
        $user = User.new(user_params)
        
        $user.assign_verification_code
        if $user.valid?
            $user.sendMail
            render :verify
        else
            
            redirect_to new_user_path
            
        end
    end

    def edit
        @user = User.find(session[:current_user_id])
    end

    def update
        @user = User.find(session[:current_user_id])
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
