require "application_system_test_case"

class DiagnosisTypesTest < ApplicationSystemTestCase
  setup do
    @diagnosis_type = diagnosis_types(:one)
  end

  test "visiting the index" do
    visit diagnosis_types_url
    assert_selector "h1", text: "Diagnosis Types"
  end

  test "creating a Diagnosis type" do
    visit diagnosis_types_url
    click_on "New Diagnosis Type"

    fill_in "Deleted at", with: @diagnosis_type.deleted_at
    fill_in "Description", with: @diagnosis_type.description
    fill_in "Name", with: @diagnosis_type.name
    click_on "Create Diagnosis type"

    assert_text "Diagnosis type was successfully created"
    click_on "Back"
  end

  test "updating a Diagnosis type" do
    visit diagnosis_types_url
    click_on "Edit", match: :first

    fill_in "Deleted at", with: @diagnosis_type.deleted_at
    fill_in "Description", with: @diagnosis_type.description
    fill_in "Name", with: @diagnosis_type.name
    click_on "Update Diagnosis type"

    assert_text "Diagnosis type was successfully updated"
    click_on "Back"
  end

  test "destroying a Diagnosis type" do
    visit diagnosis_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Diagnosis type was successfully destroyed"
  end
end
