class PostsController < ApplicationController
    
    def index
        @posts = Post.all 
    end

    def show 
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @categories = Category.all

    end

    def create
        @post = Post.new(post_params)

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
        @post.update(post_params)

        if @post.save
            redirect_to post_path(@post)
        else
            render :edit 
        end
    end
    
    private

    def post_params
        params.require(:post).permit(:content, :title, :category_ids)
    end
end
