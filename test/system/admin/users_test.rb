require "application_system_test_case"

class Admin::UsersTest < ApplicationSystemTestCase
  setup do
    @admin_user = admin_users(:one)
  end

  test "visiting the index" do
    visit admin_users_url
    assert_selector "h1", text: "Admin/Users"
  end

  test "creating a User" do
    visit admin_users_url
    click_on "New Admin/User"

    fill_in "Deleted at", with: @admin_user.deleted_at
    fill_in "Lastname", with: @admin_user.lastname
    fill_in "Name", with: @admin_user.name
    fill_in "Phone", with: @admin_user.phone
    fill_in "Role", with: @admin_user.role_id
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit admin_users_url
    click_on "Edit", match: :first

    fill_in "Deleted at", with: @admin_user.deleted_at
    fill_in "Lastname", with: @admin_user.lastname
    fill_in "Name", with: @admin_user.name
    fill_in "Phone", with: @admin_user.phone
    fill_in "Role", with: @admin_user.role_id
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit admin_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
