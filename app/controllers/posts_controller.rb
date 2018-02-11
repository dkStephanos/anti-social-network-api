class PostsController < ApplicationController

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
