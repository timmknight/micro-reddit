require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = Comment.new(content: 'This is a comment', post_id: 1, user_id: 1)
  end

  test'comment cannot be blank' do
    @comment.content = '  ' * 6
    assert_not @comment.valid?
  end

  test 'comment cannot be too long' do
    @comment.content = 'a' * 10001
    assert_not @comment.valid?
  end

  test 'comment must have a post_id' do
    @comment.post_id = ''
    assert_not @comment.valid?
  end
end
