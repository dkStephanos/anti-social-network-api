require 'toki_toki'

class Api::PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post, only: [:edit, :destroy, :update]

	def index
		@posts = Post.order('created_at DESC')
		render json: @posts
	end

	def connections_posts
		@posts = current_users_connections_posts
		render json: @posts
	end

	def show
		@post = Post.find_by(id: params[:id])
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
	    params.require(:post).permit(:content, :postType, :picture, :title)
    end

    def current_users_connections_posts
    	@posts = @current_user.posts.to_a
    	
    	@current_user.connected_users.each do |user|
    		user.posts.each do |post|
    			@posts.push(post) 
    		end
    	end
    	
    	@posts = @posts.sort_by { |obj| - obj.created_at.to_i }
    end
end
