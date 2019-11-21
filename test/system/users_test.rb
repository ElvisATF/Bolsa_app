require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Address", with: @user.address
    fill_in "Contact", with: @user.contact
    fill_in "Email", with: @user.email
    fill_in "Identity card", with: @user.identity_card
    fill_in "Level of qualifications", with: @user.level_of_qualifications
    fill_in "Literary abilities", with: @user.literary_abilities
    fill_in "Locality", with: @user.locality
    fill_in "Name", with: @user.name
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password_confirmation
    fill_in "Postal cod", with: @user.postal_cod
    fill_in "Presentation", with: @user.presentation
    fill_in "Professional area", with: @user.professional_area
    fill_in "Professional expirience", with: @user.professional_expirience
    fill_in "Professional situation", with: @user.professional_situation
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Address", with: @user.address
    fill_in "Contact", with: @user.contact
    fill_in "Email", with: @user.email
    fill_in "Identity card", with: @user.identity_card
    fill_in "Level of qualifications", with: @user.level_of_qualifications
    fill_in "Literary abilities", with: @user.literary_abilities
    fill_in "Locality", with: @user.locality
    fill_in "Name", with: @user.name
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password_confirmation
    fill_in "Postal cod", with: @user.postal_cod
    fill_in "Presentation", with: @user.presentation
    fill_in "Professional area", with: @user.professional_area
    fill_in "Professional expirience", with: @user.professional_expirience
    fill_in "Professional situation", with: @user.professional_situation
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
