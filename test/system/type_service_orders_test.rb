require "application_system_test_case"

class TypeServiceOrdersTest < ApplicationSystemTestCase
  setup do
    @type_service_order = type_service_orders(:one)
  end

  test "visiting the index" do
    visit type_service_orders_url
    assert_selector "h1", text: "Type Service Orders"
  end

  test "creating a Type service order" do
    visit type_service_orders_url
    click_on "New Type Service Order"

    fill_in "Deleted at", with: @type_service_order.deleted_at
    fill_in "Description", with: @type_service_order.description
    fill_in "Name", with: @type_service_order.name
    click_on "Create Type service order"

    assert_text "Type service order was successfully created"
    click_on "Back"
  end

  test "updating a Type service order" do
    visit type_service_orders_url
    click_on "Edit", match: :first

    fill_in "Deleted at", with: @type_service_order.deleted_at
    fill_in "Description", with: @type_service_order.description
    fill_in "Name", with: @type_service_order.name
    click_on "Update Type service order"

    assert_text "Type service order was successfully updated"
    click_on "Back"
  end

  test "destroying a Type service order" do
    visit type_service_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Type service order was successfully destroyed"
  end
end
