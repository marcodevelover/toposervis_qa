require "application_system_test_case"

class PaymentWaysTest < ApplicationSystemTestCase
  setup do
    @payment_way = payment_ways(:one)
  end

  test "visiting the index" do
    visit payment_ways_url
    assert_selector "h1", text: "Payment Ways"
  end

  test "creating a Payment way" do
    visit payment_ways_url
    click_on "New Payment Way"

    fill_in "Deleted at", with: @payment_way.deleted_at
    fill_in "Description", with: @payment_way.description
    fill_in "Name", with: @payment_way.name
    click_on "Create Payment way"

    assert_text "Payment way was successfully created"
    click_on "Back"
  end

  test "updating a Payment way" do
    visit payment_ways_url
    click_on "Edit", match: :first

    fill_in "Deleted at", with: @payment_way.deleted_at
    fill_in "Description", with: @payment_way.description
    fill_in "Name", with: @payment_way.name
    click_on "Update Payment way"

    assert_text "Payment way was successfully updated"
    click_on "Back"
  end

  test "destroying a Payment way" do
    visit payment_ways_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Payment way was successfully destroyed"
  end
end
