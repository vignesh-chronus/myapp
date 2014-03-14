class CommentsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]

	def create
	  @comment = Comment.new(params[:comment])
    if @comment.save
      @feed_item = @comment.micropost
      respond_to do |format|
      	format.html { redirect_to root_url }
      	format.js
      end
    else
      respond_to do |format|
      	format.html { redirect_to root_url }
      	format.js
      end
    end
	end

	def destroy
		@comment = Comment.find(params[:id])
    @feed_item = @comment.micropost
		@comment.destroy
		respond_to do |format|
      		format.html { redirect_to root_url }
      		format.js
    	end
	end

end
