require "application_system_test_case"

class LendingsTest < ApplicationSystemTestCase
  setup do
    @lending = lendings(:one)
  end

  test "visiting the index" do
    visit lendings_url
    assert_selector "h1", text: "Lendings"
  end

  test "creating a Lending" do
    visit lendings_url
    click_on "New Lending"

    fill_in "Adjustment total", with: @lending.adjustment_total
    fill_in "Created by", with: @lending.created_by_id
    fill_in "Currency", with: @lending.currency_id
    fill_in "Date", with: @lending.date
    fill_in "Deleted at", with: @lending.deleted_at
    fill_in "Description", with: @lending.description
    fill_in "Entry code", with: @lending.entry_code_id
    fill_in "Exchange rate", with: @lending.exchange_rate
    fill_in "Folio", with: @lending.folio
    fill_in "Name", with: @lending.name
    fill_in "Observation", with: @lending.observation
    fill_in "Provider", with: @lending.provider_id
    fill_in "Receipt type", with: @lending.receipt_type_id
    fill_in "Responsible", with: @lending.responsible
    fill_in "State", with: @lending.state
    fill_in "Subtotal", with: @lending.subtotal
    fill_in "Tax", with: @lending.tax
    fill_in "Tax item total", with: @lending.tax_item_total
    fill_in "Tax total", with: @lending.tax_total
    fill_in "Total", with: @lending.total
    fill_in "Validity", with: @lending.validity
    click_on "Create Lending"

    assert_text "Lending was successfully created"
    click_on "Back"
  end

  test "updating a Lending" do
    visit lendings_url
    click_on "Edit", match: :first

    fill_in "Adjustment total", with: @lending.adjustment_total
    fill_in "Created by", with: @lending.created_by_id
    fill_in "Currency", with: @lending.currency_id
    fill_in "Date", with: @lending.date
    fill_in "Deleted at", with: @lending.deleted_at
    fill_in "Description", with: @lending.description
    fill_in "Entry code", with: @lending.entry_code_id
    fill_in "Exchange rate", with: @lending.exchange_rate
    fill_in "Folio", with: @lending.folio
    fill_in "Name", with: @lending.name
    fill_in "Observation", with: @lending.observation
    fill_in "Provider", with: @lending.provider_id
    fill_in "Receipt type", with: @lending.receipt_type_id
    fill_in "Responsible", with: @lending.responsible
    fill_in "State", with: @lending.state
    fill_in "Subtotal", with: @lending.subtotal
    fill_in "Tax", with: @lending.tax
    fill_in "Tax item total", with: @lending.tax_item_total
    fill_in "Tax total", with: @lending.tax_total
    fill_in "Total", with: @lending.total
    fill_in "Validity", with: @lending.validity
    click_on "Update Lending"

    assert_text "Lending was successfully updated"
    click_on "Back"
  end

  test "destroying a Lending" do
    visit lendings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lending was successfully destroyed"
  end
end
