require "application_system_test_case"

class QuotationServicesTest < ApplicationSystemTestCase
  setup do
    @quotation_service = quotation_services(:one)
  end

  test "visiting the index" do
    visit quotation_services_url
    assert_selector "h1", text: "Quotation Services"
  end

  test "creating a Quotation service" do
    visit quotation_services_url
    click_on "New Quotation Service"

    fill_in "Adjustment total", with: @quotation_service.adjustment_total
    fill_in "Canceled at", with: @quotation_service.canceled_at
    fill_in "Condition", with: @quotation_service.condition
    fill_in "Created by", with: @quotation_service.created_by_id
    fill_in "Currency", with: @quotation_service.currency_id
    fill_in "Customer", with: @quotation_service.customer_id
    fill_in "Exchange rate", with: @quotation_service.exchange_rate
    fill_in "Item total", with: @quotation_service.item_total
    fill_in "Number", with: @quotation_service.number
    fill_in "State", with: @quotation_service.state
    fill_in "Tax", with: @quotation_service.tax
    fill_in "Tax item total", with: @quotation_service.tax_item_total
    fill_in "Tax total", with: @quotation_service.tax_total
    fill_in "Total", with: @quotation_service.total
    fill_in "Validity", with: @quotation_service.validity
    click_on "Create Quotation service"

    assert_text "Quotation service was successfully created"
    click_on "Back"
  end

  test "updating a Quotation service" do
    visit quotation_services_url
    click_on "Edit", match: :first

    fill_in "Adjustment total", with: @quotation_service.adjustment_total
    fill_in "Canceled at", with: @quotation_service.canceled_at
    fill_in "Condition", with: @quotation_service.condition
    fill_in "Created by", with: @quotation_service.created_by_id
    fill_in "Currency", with: @quotation_service.currency_id
    fill_in "Customer", with: @quotation_service.customer_id
    fill_in "Exchange rate", with: @quotation_service.exchange_rate
    fill_in "Item total", with: @quotation_service.item_total
    fill_in "Number", with: @quotation_service.number
    fill_in "State", with: @quotation_service.state
    fill_in "Tax", with: @quotation_service.tax
    fill_in "Tax item total", with: @quotation_service.tax_item_total
    fill_in "Tax total", with: @quotation_service.tax_total
    fill_in "Total", with: @quotation_service.total
    fill_in "Validity", with: @quotation_service.validity
    click_on "Update Quotation service"

    assert_text "Quotation service was successfully updated"
    click_on "Back"
  end

  test "destroying a Quotation service" do
    visit quotation_services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quotation service was successfully destroyed"
  end
end
