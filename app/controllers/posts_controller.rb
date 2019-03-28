class PostsController < ApplicationController
    
    before_action :authenticate

    def index
        @posts = Post.sort_posts_by_time 
        @categories = Category.all
    end

    def show 
        @post = Post.find(params[:id])
        @reply = Reply.new
    end

    def new
        @post = Post.new
        @categories = Category.all

    end

    def create

        @post = Post.new(post_params)
        @post.user_id = session[:current_user_id]
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            redirect_to new_post_path
        end
    end

    def edit
        @post = Post.find(params[:id])
        @categories = Category.all
    end

    def update
        @post = Post.find(params[:id])
        @post.update_attributes(post_params)
        @post.user_id = session[:current_user_id]


        if @post.save
            redirect_to post_path(@post)
        else
            render :edit 
        end
    end
    
    private

    def post_params
        params.require(:post).permit(:content, :title, :user_id, :category_ids => [])
        
    end
end
