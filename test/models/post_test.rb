require 'test_helper'

class PostTest < ActiveSupport::TestCase
 	def setup
		@post = Post.new(title: 'Example post', body: "Post body, blah blah blah blah", user_id: '1')
	end

  # user_id
	test 'user_id must not be blank' do
		@post.user_id = ' '
		assert_not @post.valid?
	end

  test 'user_id must be a number' do
    @post.user_id = 'a'
    assert_not @post.valid?
  end
	# title test
  test "title must not be blank" do
  	@post.title = '   '
  	assert_not @post.valid?
  end

  test 'title must not be too long' do
  	@post.title = 'a' * 501
  	assert_not @post.valid?
  end

  # body test
	test 'body must not be blank' do
  	@post.body = '   ' 
  	assert_not @post.valid?
  end

  test "body must not be too long" do
  	@post.body = 'a' * 10001
  	assert_not @post.valid?
  end
end
