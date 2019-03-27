class RepliesController < ApplicationController

    def new
        @reply = Reply.new
    end

    def create
        #byebug

        @reply = Reply.create(reply_params)
        post_id = params[:post_id]
        redirect_to "/posts/#{post_id}"
    end
        

    def reply_params
        params.require(:reply).permit(:content, :post_id)
    end
end