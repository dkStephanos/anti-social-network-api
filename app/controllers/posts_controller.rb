class API::PostsController < ApplicationController

	def index
		render json: Post.all
	end

	def show
		set_post
		render json: @post
	end


	private

	def set_post
		@post = Post.find_by(id: params[:id]);
	end

	def post_params
	    params.require(:post).permit(
	      [
	        :content,
	        :postType,
	        :photo 
	      ]
	    )
    end
end
