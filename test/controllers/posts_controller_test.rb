require 'test_helper'
require 'toki_toki'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @token = TokiToki.encode(@user.login)
    @post = @user.posts.first
  end

  # ...

  test 'should create post' do
    assert_difference('Post.count') do
      post posts_url, params: {
        token: @token,
        post: {
          answer: @post.answer,
          question: @post.question,
          user_id: @post.user_id
        }
      }, as: :json
    end

    assert_response 201
  end

  test 'should show post' do
    get post_url(@post), params: {
      token: @token
    }
    assert_response :success
  end
end
