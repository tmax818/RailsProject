require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@email.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "email validation should accept valid email" do
    valid_addresses = %w[user@example.com USER@foo.COM first.last@aol.ca first_last@booo.edu]

    valid_addresses.each do |va|
      @user.email = va
      assert @user.valid?
    end
  end

  test "email validation should reject invalid email" do
    invalid_addresses = %w[user@example,com USER_foo.COM first.last@aol_earthlink.ca first_last@bo+oo.edu]

    invalid_addresses.each do |iva|
      @user.email = iva
      assert_not @user.valid?
    end
  end


end
