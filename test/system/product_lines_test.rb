require "application_system_test_case"

class ProductLinesTest < ApplicationSystemTestCase
  setup do
    @product_line = product_lines(:one)
  end

  test "visiting the index" do
    visit product_lines_url
    assert_selector "h1", text: "Product Lines"
  end

  test "creating a Product line" do
    visit product_lines_url
    click_on "New Product Line"

    fill_in "Deleted at", with: @product_line.deleted_at
    fill_in "Description", with: @product_line.description
    fill_in "Name", with: @product_line.name
    click_on "Create Product line"

    assert_text "Product line was successfully created"
    click_on "Back"
  end

  test "updating a Product line" do
    visit product_lines_url
    click_on "Edit", match: :first

    fill_in "Deleted at", with: @product_line.deleted_at
    fill_in "Description", with: @product_line.description
    fill_in "Name", with: @product_line.name
    click_on "Update Product line"

    assert_text "Product line was successfully updated"
    click_on "Back"
  end

  test "destroying a Product line" do
    visit product_lines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product line was successfully destroyed"
  end
end
