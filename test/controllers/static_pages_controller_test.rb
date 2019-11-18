require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get entidades" do
    get static_pages_entidades_url
    assert_response :success
  end

  test "should get candidatos" do
    get static_pages_candidatos_url
    assert_response :success
  end

end
