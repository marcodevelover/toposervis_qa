require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "Adjustment total", with: @project.adjustment_total
    fill_in "Created by", with: @project.created_by_id
    fill_in "Currency", with: @project.currency_id
    fill_in "Date", with: @project.date
    fill_in "Deleted at", with: @project.deleted_at
    fill_in "Description", with: @project.description
    fill_in "Entry code", with: @project.entry_code_id
    fill_in "Exchange rate", with: @project.exchange_rate
    fill_in "Folio", with: @project.folio
    fill_in "Name", with: @project.name
    fill_in "Observation", with: @project.observation
    fill_in "Provider", with: @project.provider_id
    fill_in "Receipt type", with: @project.receipt_type_id
    fill_in "State", with: @project.state
    fill_in "Subtotal", with: @project.subtotal
    fill_in "Tax", with: @project.tax
    fill_in "Tax item total", with: @project.tax_item_total
    fill_in "Tax total", with: @project.tax_total
    fill_in "Total", with: @project.total
    fill_in "Validity", with: @project.validity
    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "updating a Project" do
    visit projects_url
    click_on "Edit", match: :first

    fill_in "Adjustment total", with: @project.adjustment_total
    fill_in "Created by", with: @project.created_by_id
    fill_in "Currency", with: @project.currency_id
    fill_in "Date", with: @project.date
    fill_in "Deleted at", with: @project.deleted_at
    fill_in "Description", with: @project.description
    fill_in "Entry code", with: @project.entry_code_id
    fill_in "Exchange rate", with: @project.exchange_rate
    fill_in "Folio", with: @project.folio
    fill_in "Name", with: @project.name
    fill_in "Observation", with: @project.observation
    fill_in "Provider", with: @project.provider_id
    fill_in "Receipt type", with: @project.receipt_type_id
    fill_in "State", with: @project.state
    fill_in "Subtotal", with: @project.subtotal
    fill_in "Tax", with: @project.tax
    fill_in "Tax item total", with: @project.tax_item_total
    fill_in "Tax total", with: @project.tax_total
    fill_in "Total", with: @project.total
    fill_in "Validity", with: @project.validity
    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "destroying a Project" do
    visit projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project was successfully destroyed"
  end
end
