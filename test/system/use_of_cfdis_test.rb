require "application_system_test_case"

class UseOfCfdisTest < ApplicationSystemTestCase
  setup do
    @use_of_cfdi = use_of_cfdis(:one)
  end

  test "visiting the index" do
    visit use_of_cfdis_url
    assert_selector "h1", text: "Use Of Cfdis"
  end

  test "creating a Use of cfdi" do
    visit use_of_cfdis_url
    click_on "New Use Of Cfdi"

    fill_in "Cfdi key", with: @use_of_cfdi.cfdi_key
    fill_in "Descripcion", with: @use_of_cfdi.descripcion
    check "Persona fisica" if @use_of_cfdi.persona_fisica
    check "Persona moral" if @use_of_cfdi.persona_moral
    click_on "Create Use of cfdi"

    assert_text "Use of cfdi was successfully created"
    click_on "Back"
  end

  test "updating a Use of cfdi" do
    visit use_of_cfdis_url
    click_on "Edit", match: :first

    fill_in "Cfdi key", with: @use_of_cfdi.cfdi_key
    fill_in "Descripcion", with: @use_of_cfdi.descripcion
    check "Persona fisica" if @use_of_cfdi.persona_fisica
    check "Persona moral" if @use_of_cfdi.persona_moral
    click_on "Update Use of cfdi"

    assert_text "Use of cfdi was successfully updated"
    click_on "Back"
  end

  test "destroying a Use of cfdi" do
    visit use_of_cfdis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Use of cfdi was successfully destroyed"
  end
end
