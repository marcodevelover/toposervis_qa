require "application_system_test_case"

class PurchasesTest < ApplicationSystemTestCase
  setup do
    @purchase = purchases(:one)
  end

  test "visiting the index" do
    visit purchases_url
    assert_selector "h1", text: "Purchases"
  end

  test "creating a Purchase" do
    visit purchases_url
    click_on "New Purchase"

    fill_in "Adjustment total", with: @purchase.adjustment_total
    fill_in "Created by", with: @purchase.created_by_id
    fill_in "Currency", with: @purchase.currency_id
    fill_in "Date", with: @purchase.date
    fill_in "Deleted at", with: @purchase.deleted_at
    fill_in "Entry code", with: @purchase.entry_code_id
    fill_in "Exchange rate", with: @purchase.exchange_rate
    fill_in "Folio", with: @purchase.folio
    fill_in "Item total", with: @purchase.item_total
    fill_in "Observation", with: @purchase.observation
    fill_in "Provider", with: @purchase.provider_id
    fill_in "Receipt type", with: @purchase.receipt_type_id
    fill_in "State", with: @purchase.state
    fill_in "Tax", with: @purchase.tax
    fill_in "Tax item total", with: @purchase.tax_item_total
    fill_in "Tax total", with: @purchase.tax_total
    fill_in "Total", with: @purchase.total
    fill_in "Validity", with: @purchase.validity
    click_on "Create Purchase"

    assert_text "Purchase was successfully created"
    click_on "Back"
  end

  test "updating a Purchase" do
    visit purchases_url
    click_on "Edit", match: :first

    fill_in "Adjustment total", with: @purchase.adjustment_total
    fill_in "Created by", with: @purchase.created_by_id
    fill_in "Currency", with: @purchase.currency_id
    fill_in "Date", with: @purchase.date
    fill_in "Deleted at", with: @purchase.deleted_at
    fill_in "Entry code", with: @purchase.entry_code_id
    fill_in "Exchange rate", with: @purchase.exchange_rate
    fill_in "Folio", with: @purchase.folio
    fill_in "Item total", with: @purchase.item_total
    fill_in "Observation", with: @purchase.observation
    fill_in "Provider", with: @purchase.provider_id
    fill_in "Receipt type", with: @purchase.receipt_type_id
    fill_in "State", with: @purchase.state
    fill_in "Tax", with: @purchase.tax
    fill_in "Tax item total", with: @purchase.tax_item_total
    fill_in "Tax total", with: @purchase.tax_total
    fill_in "Total", with: @purchase.total
    fill_in "Validity", with: @purchase.validity
    click_on "Update Purchase"

    assert_text "Purchase was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase" do
    visit purchases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase was successfully destroyed"
  end
end
