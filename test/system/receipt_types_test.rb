require "application_system_test_case"

class ReceiptTypesTest < ApplicationSystemTestCase
  setup do
    @receipt_type = receipt_types(:one)
  end

  test "visiting the index" do
    visit receipt_types_url
    assert_selector "h1", text: "Receipt Types"
  end

  test "creating a Receipt type" do
    visit receipt_types_url
    click_on "New Receipt Type"

    fill_in "Deleted at", with: @receipt_type.deleted_at
    fill_in "Description", with: @receipt_type.description
    fill_in "Name", with: @receipt_type.name
    click_on "Create Receipt type"

    assert_text "Receipt type was successfully created"
    click_on "Back"
  end

  test "updating a Receipt type" do
    visit receipt_types_url
    click_on "Edit", match: :first

    fill_in "Deleted at", with: @receipt_type.deleted_at
    fill_in "Description", with: @receipt_type.description
    fill_in "Name", with: @receipt_type.name
    click_on "Update Receipt type"

    assert_text "Receipt type was successfully updated"
    click_on "Back"
  end

  test "destroying a Receipt type" do
    visit receipt_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Receipt type was successfully destroyed"
  end
end
