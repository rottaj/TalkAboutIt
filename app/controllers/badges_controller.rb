class BadgesController < ApplicationController

	def index
		@badges = Badge.all
	end

	def show
		@badge = Badge.find(params[:id])
	end

	def new
		@badge = Badge.new
	end

	def create
		@badge = Badge.new(badge_params)
		if @badge.valid?
			@badge.save
			redirect_to @badge
		else
			render :new
		end
	end

	def edit
		@badge = Badge.find(params[:id])
	end

	def update
		@badge = Badge.find(params[:id])
		@badge.update(badge_params)

        if @badge.save
            redirect_to badge_path(@badge)
        else
            render :edit 
        end
	end

	def badge_params
		params.require(:badge).permit(:name)
	end
end
