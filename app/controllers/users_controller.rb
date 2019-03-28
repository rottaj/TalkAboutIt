class UsersController < ApplicationController

   before_action :checked


   def checked
    if session[:current_user_id] == nil
        redirect_to "/signin"
    end
   end
   
    def verify
        #@user = User.find(params[:id])
        input = params[:input]
        $user.verification_code == input ? ($user.verication_code = "True") : (puts "Check your email!")
        redirect_to '/posts'
        flash[:notice] = "Email Verified!"
    end

    def index
        @users = User.all
    end

    def show 
        @user = session[:current_user_id]
    end

    def new
        @user = User.new
    end

    def create
        $user = User.new(user_params)
        $user.assign_verification_code
        #if $user.valid?
            #$user.save
            $user.sendMail
            render :verify
        #else
            # byebug
            #redirect_to new_user_path
        #end
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
