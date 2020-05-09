require "application_system_test_case"

class QuotationsTest < ApplicationSystemTestCase
  setup do
    @quotation = quotations(:one)
  end

  test "visiting the index" do
    visit quotations_url
    assert_selector "h1", text: "Quotations"
  end

  test "creating a Quotation" do
    visit quotations_url
    click_on "New Quotation"

    fill_in "Adjustment total", with: @quotation.adjustment_total
    fill_in "Canceled at", with: @quotation.deleted_at
    fill_in "Condition", with: @quotation.condition
    fill_in "Created by", with: @quotation.created_by_id
    fill_in "Currency", with: @quotation.currency_id
    fill_in "Customer", with: @quotation.customer_id
    fill_in "Exchange rate", with: @quotation.exchange_rate
    fill_in "Item total", with: @quotation.item_total
    fill_in "Number", with: @quotation.number
    fill_in "State", with: @quotation.state
    fill_in "Tax", with: @quotation.tax
    fill_in "Tax item total", with: @quotation.tax_item_total
    fill_in "Tax total", with: @quotation.tax_total
    fill_in "Total", with: @quotation.total
    fill_in "Validity", with: @quotation.validity
    click_on "Create Quotation"

    assert_text "Quotation was successfully created"
    click_on "Back"
  end

  test "updating a Quotation" do
    visit quotations_url
    click_on "Edit", match: :first

    fill_in "Adjustment total", with: @quotation.adjustment_total
    fill_in "Canceled at", with: @quotation.deleted_at
    fill_in "Condition", with: @quotation.condition
    fill_in "Created by", with: @quotation.created_by_id
    fill_in "Currency", with: @quotation.currency_id
    fill_in "Customer", with: @quotation.customer_id
    fill_in "Exchange rate", with: @quotation.exchange_rate
    fill_in "Item total", with: @quotation.item_total
    fill_in "Number", with: @quotation.number
    fill_in "State", with: @quotation.state
    fill_in "Tax", with: @quotation.tax
    fill_in "Tax item total", with: @quotation.tax_item_total
    fill_in "Tax total", with: @quotation.tax_total
    fill_in "Total", with: @quotation.total
    fill_in "Validity", with: @quotation.validity
    click_on "Update Quotation"

    assert_text "Quotation was successfully updated"
    click_on "Back"
  end

  test "destroying a Quotation" do
    visit quotations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quotation was successfully destroyed"
  end
end
