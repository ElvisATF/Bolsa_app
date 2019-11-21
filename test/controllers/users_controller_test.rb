require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { address: @user.address, contact: @user.contact, email: @user.email, identity_card: @user.identity_card, level_of_qualifications: @user.level_of_qualifications, literary_abilities: @user.literary_abilities, locality: @user.locality, name: @user.name, password: @user.password, password_confirmation: @user.password_confirmation, postal_cod: @user.postal_cod, presentation: @user.presentation, professional_area: @user.professional_area, professional_expirience: @user.professional_expirience, professional_situation: @user.professional_situation } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { address: @user.address, contact: @user.contact, email: @user.email, identity_card: @user.identity_card, level_of_qualifications: @user.level_of_qualifications, literary_abilities: @user.literary_abilities, locality: @user.locality, name: @user.name, password: @user.password, password_confirmation: @user.password_confirmation, postal_cod: @user.postal_cod, presentation: @user.presentation, professional_area: @user.professional_area, professional_expirience: @user.professional_expirience, professional_situation: @user.professional_situation } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
