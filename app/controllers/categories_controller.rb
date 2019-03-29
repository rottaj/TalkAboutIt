class CategoriesController < ApplicationController

	before_action :authenticate

	def index
		@categories = Category.sort_by_posts
	end

	def show
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.valid?
			@category.save
			redirect_to categories_path
		else
			render :new
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update

	end

	def category_params
		params.require(:category).permit(:name)
	end
end
