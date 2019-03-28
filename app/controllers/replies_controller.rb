class RepliesController < ApplicationController

    before_action :authenticate

    def new
        @reply = Reply.new
    end

    def create
        @reply = Reply.create(reply_params)
        post_id = reply_params[:post_id]
        #byebug
        redirect_to "/posts/#{post_id}"
    end
        

    def reply_params
        params.require(:reply).permit(:content, :post_id)
    end
end