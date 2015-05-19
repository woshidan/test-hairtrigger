require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user name should be unique" do
    p User.all
    assert_no_difference 'User.count' do
      User.create(name: users(:one).name)
      p User.all
    end
  end
end
