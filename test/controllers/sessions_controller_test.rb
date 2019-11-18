require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get news" do
    get sessions_news_url
    assert_response :success
  end

end
