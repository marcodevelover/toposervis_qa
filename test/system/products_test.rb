require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Accessory", with: @product.accessory_id
    fill_in "Brand", with: @product.brand
    fill_in "Comment", with: @product.comment
    fill_in "Deleted at", with: @product.deleted_at
    fill_in "Description", with: @product.description
    fill_in "Model", with: @product.model
    fill_in "Name", with: @product.name
    fill_in "Product line", with: @product.product_line_id
    fill_in "Provider", with: @product.provider_id
    fill_in "Unit", with: @product.unit_id
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Accessory", with: @product.accessory_id
    fill_in "Brand", with: @product.brand
    fill_in "Comment", with: @product.comment
    fill_in "Deleted at", with: @product.deleted_at
    fill_in "Description", with: @product.description
    fill_in "Model", with: @product.model
    fill_in "Name", with: @product.name
    fill_in "Product line", with: @product.product_line_id
    fill_in "Provider", with: @product.provider_id
    fill_in "Unit", with: @product.unit_id
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
