class API::PostsController < ApplicationController
	before_action: :set_post, only: [:show, :edit, :delete]

	def index
		render json: Post.all
	end

	def show
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
