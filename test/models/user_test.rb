require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:wojciech)
    @user2 = users(:tomasz)
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'user should not be valid with empty first_name' do
    @user.first_name = nil
    assert_not @user.valid?
  end

  test 'user should not be valid with empty last_name' do
    @user.last_name = nil
    assert_not @user.valid?
  end

  test 'user should not be valid with empty email' do
    @user.email = nil
    assert_not @user.valid?
  end

  test 'email must be unique, also with case_sensitive' do
    @user2.email = 'WOJCIECH@example.com'
    assert_not @user2.valid?
  end

  test 'user should not be valid with empty password' do
    @user.password = ' '
    assert_not @user.valid?
  end
end
