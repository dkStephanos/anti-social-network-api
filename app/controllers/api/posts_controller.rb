class Api::PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :destroy, :update]

	def index
		render json: Post.all
	end

	def show
		render json: @post
	end

	def update
		if @post.update(post_params)
			render json: @post
		else
			render json: { message: @post.errors}, status: 400
		end
	end

	def create
		@post = Post.new(post_params)
		if @post.save(post_params)
			render json: @post
		else
			render json: { message: @post.errors}, status: 400
		end
	end

	def destroy
		if @post.destroy
			render status: 204
		else
			render json: { message: "Unable to delete post." }, status: 400
		end
	end

	private

	def set_post
		@post = Post.find_by(id: params[:id]);
	end

	def post_params
	    params.require(:post).permit(:content, :postType, :photo)
    end
end
