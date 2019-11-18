require 'test_helper'

class UsersEnControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_en_new_url
    assert_response :success
  end

end
