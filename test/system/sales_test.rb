require "application_system_test_case"

class SalesTest < ApplicationSystemTestCase
  setup do
    @sale = sales(:one)
  end

  test "visiting the index" do
    visit sales_url
    assert_selector "h1", text: "Sales"
  end

  test "creating a Sale" do
    visit sales_url
    click_on "New Sale"

    fill_in "Date", with: @sale.date
    fill_in "Deleted at", with: @sale.deleted_at
    fill_in "Folio", with: @sale.folio
    fill_in "Observation", with: @sale.observation
    fill_in "Payment method", with: @sale.payment_method_id
    fill_in "Payment way", with: @sale.payment_way_id
    fill_in "Reference", with: @sale.reference
    click_on "Create Sale"

    assert_text "Sale was successfully created"
    click_on "Back"
  end

  test "updating a Sale" do
    visit sales_url
    click_on "Edit", match: :first

    fill_in "Date", with: @sale.date
    fill_in "Deleted at", with: @sale.deleted_at
    fill_in "Folio", with: @sale.folio
    fill_in "Observation", with: @sale.observation
    fill_in "Payment method", with: @sale.payment_method_id
    fill_in "Payment way", with: @sale.payment_way_id
    fill_in "Reference", with: @sale.reference
    click_on "Update Sale"

    assert_text "Sale was successfully updated"
    click_on "Back"
  end

  test "destroying a Sale" do
    visit sales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sale was successfully destroyed"
  end
end
