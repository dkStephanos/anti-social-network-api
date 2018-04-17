require 'toki_toki'

class Api::CommentsController < ApplicationController
	before_action :authenticate_user!
	def index
		@post = Post.find_by(id: params[:post_id])
		@comments = @post.comments
		render json: @comments
	end

	def show
		@comment = Comment.find_by(id: params[:id])
		render json: @comment
	end

	def update
		if @comment.update(comment_params)
			render json: @comment
		else
			render json: { message: @comment.errors}, status: 400
		end
	end

	def create
		@comment = Comment.new(comment_params)
		
		@comment.user = @current_user
		if @comment.save(comment_params)
			render json: @comment
		else
			render json: { message: @comment.errors}, status: 400
		end
	end

	def destroy
		if @comment.destroy
			render status: 204
		else
			render json: { message: "Unable to delete comment." }, status: 400
		end
	end

	private

	def comment_params
	    params.require(:comment).permit(:body, :post_id)
    end
end
