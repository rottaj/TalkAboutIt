class CategoriesController < ApplicationController

	before_action :authenticate

	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params(:name))
		if @category.valid?
			@category.save
			redirect_to @category
		else
			render :new
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update

	end

	def category_params(*args)
		params.require(:category).permit(*args)
	end
end
