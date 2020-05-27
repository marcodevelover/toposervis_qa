require "application_system_test_case"

class EntryCodesTest < ApplicationSystemTestCase
  setup do
    @entry_code = entry_codes(:one)
  end

  test "visiting the index" do
    visit entry_codes_url
    assert_selector "h1", text: "Entry Codes"
  end

  test "creating a Entry code" do
    visit entry_codes_url
    click_on "New Entry Code"

    fill_in "Deleted at", with: @entry_code.deleted_at
    fill_in "Description", with: @entry_code.description
    fill_in "Name", with: @entry_code.name
    click_on "Create Entry code"

    assert_text "Entry code was successfully created"
    click_on "Back"
  end

  test "updating a Entry code" do
    visit entry_codes_url
    click_on "Edit", match: :first

    fill_in "Deleted at", with: @entry_code.deleted_at
    fill_in "Description", with: @entry_code.description
    fill_in "Name", with: @entry_code.name
    click_on "Update Entry code"

    assert_text "Entry code was successfully updated"
    click_on "Back"
  end

  test "destroying a Entry code" do
    visit entry_codes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entry code was successfully destroyed"
  end
end
