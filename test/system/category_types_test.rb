require "application_system_test_case"

class CategoryTypesTest < ApplicationSystemTestCase
  setup do
    @category_type = category_types(:one)
  end

  test "visiting the index" do
    visit category_types_url
    assert_selector "h1", text: "Category Types"
  end

  test "creating a Category type" do
    visit category_types_url
    click_on "New Category Type"

    fill_in "Deleted at", with: @category_type.deleted_at
    fill_in "Description", with: @category_type.description
    fill_in "Name", with: @category_type.name
    click_on "Create Category type"

    assert_text "Category type was successfully created"
    click_on "Back"
  end

  test "updating a Category type" do
    visit category_types_url
    click_on "Edit", match: :first

    fill_in "Deleted at", with: @category_type.deleted_at
    fill_in "Description", with: @category_type.description
    fill_in "Name", with: @category_type.name
    click_on "Update Category type"

    assert_text "Category type was successfully updated"
    click_on "Back"
  end

  test "destroying a Category type" do
    visit category_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Category type was successfully destroyed"
  end
end
