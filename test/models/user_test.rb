require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name: "example", email: "blah@example.com")
  end

# User.name tests
  test "name must be present" do
 		@user.name = " " * 6
 		assert_not @user.valid?    
  end

  test "name can't be too short" do
  	@user.name = "a"
  	assert_not @user.valid?
  end

  test "name should not be too long" do
  	@user.name = "a" * 52
  	assert_not @user.valid?
  end

  test "name must be unique" do
  	duplicate_user = @user.dup
    duplicate_user.name = duplicate_user.name
    @user.save
    assert_not duplicate_user.valid?
  end

# User.email tests
  test "email must be present" do
  	@user.email = " " * 6
  	assert_not @user.valid?
  end

  test "email cannot be too long" do
  	@user.name = "a" * 244 + "@example.com"
  	assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
  	valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]

    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
  	end
  end

  test "email validation should reject invalid addresses" do
  	invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = duplicate_user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower case" do 
    mixed_case_email = "Foo@ExAmPLe.coM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
