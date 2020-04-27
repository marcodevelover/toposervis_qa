require "application_system_test_case"

class Admin::RolesTest < ApplicationSystemTestCase
  setup do
    @admin_role = admin_roles(:one)
  end

  test "visiting the index" do
    visit admin_roles_url
    assert_selector "h1", text: "Admin/Roles"
  end

  test "creating a Role" do
    visit admin_roles_url
    click_on "New Admin/Role"

    fill_in "Deleted at", with: @admin_role.deleted_at
    fill_in "Description", with: @admin_role.description
    click_on "Create Role"

    assert_text "Role was successfully created"
    click_on "Back"
  end

  test "updating a Role" do
    visit admin_roles_url
    click_on "Edit", match: :first

    fill_in "Deleted at", with: @admin_role.deleted_at
    fill_in "Description", with: @admin_role.description
    click_on "Update Role"

    assert_text "Role was successfully updated"
    click_on "Back"
  end

  test "destroying a Role" do
    visit admin_roles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Role was successfully destroyed"
  end
end
