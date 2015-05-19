require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user name should be unique" do
    assert_no_difference 'User.count' do
      User.create(name: users(:one).name)
    end
  end
end
