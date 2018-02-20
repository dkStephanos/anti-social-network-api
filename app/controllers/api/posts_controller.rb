require 'toki_toki'

class Api::PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post, only: [:show, :edit, :destroy, :update]

	def index
		@posts = Post.all
		render json: @posts
	end

	def connections_posts
		@posts = current_users_connections_posts
		render json: @posts
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
		@post.user = @current_user
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
		@post = @current_user.posts.find(params[:id])
	end

	def post_params
	    params.require(:post).permit(:content, :postType, :photo)
    end

    def current_users_connections_posts
    	@posts = @current_user.posts

    	@current_user.connected_users.each do |user|
    		@posts << user.posts
    	end

    	@posts = @posts.sort_by { |obj| - obj.created_at.to_i }
    end
end
