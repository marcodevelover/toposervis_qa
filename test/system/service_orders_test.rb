require "application_system_test_case"

class ServiceOrdersTest < ApplicationSystemTestCase
  setup do
    @service_order = service_orders(:one)
  end

  test "visiting the index" do
    visit service_orders_url
    assert_selector "h1", text: "Service Orders"
  end

  test "creating a Service order" do
    visit service_orders_url
    click_on "New Service Order"

    fill_in "Brand", with: @service_order.brand
    fill_in "Customer", with: @service_order.customer_id
    fill_in "Date admission", with: @service_order.date_admission
    fill_in "Deleted at", with: @service_order.deleted_at
    fill_in "Model", with: @service_order.model
    fill_in "Observation", with: @service_order.observation
    fill_in "Product", with: @service_order.product_id
    fill_in "Serie", with: @service_order.serie
    fill_in "Status", with: @service_order.status
    click_on "Create Service order"

    assert_text "Service order was successfully created"
    click_on "Back"
  end

  test "updating a Service order" do
    visit service_orders_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @service_order.brand
    fill_in "Customer", with: @service_order.customer_id
    fill_in "Date admission", with: @service_order.date_admission
    fill_in "Deleted at", with: @service_order.deleted_at
    fill_in "Model", with: @service_order.model
    fill_in "Observation", with: @service_order.observation
    fill_in "Product", with: @service_order.product_id
    fill_in "Serie", with: @service_order.serie
    fill_in "Status", with: @service_order.status
    click_on "Update Service order"

    assert_text "Service order was successfully updated"
    click_on "Back"
  end

  test "destroying a Service order" do
    visit service_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Service order was successfully destroyed"
  end
end
