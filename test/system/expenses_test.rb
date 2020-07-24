require "application_system_test_case"

class ExpensesTest < ApplicationSystemTestCase
  setup do
    @expense = expenses(:one)
  end

  test "visiting the index" do
    visit expenses_url
    assert_selector "h1", text: "Expenses"
  end

  test "creating a Expense" do
    visit expenses_url
    click_on "New Expense"

    fill_in "Account", with: @expense.account_id
    fill_in "Category", with: @expense.category_id
    fill_in "Category type", with: @expense.category_type_id
    fill_in "Comment", with: @expense.comment
    fill_in "Concept", with: @expense.concept
    fill_in "Date", with: @expense.date
    fill_in "Deleted at", with: @expense.deleted_at
    fill_in "Document type", with: @expense.document_type_id
    fill_in "Folio", with: @expense.folio
    fill_in "Last digit", with: @expense.last_digit
    fill_in "Payment method", with: @expense.payment_method_id
    fill_in "Project", with: @expense.project
    fill_in "Provider", with: @expense.provider_id
    fill_in "Purchase order", with: @expense.purchase_order
    click_on "Create Expense"

    assert_text "Expense was successfully created"
    click_on "Back"
  end

  test "updating a Expense" do
    visit expenses_url
    click_on "Edit", match: :first

    fill_in "Account", with: @expense.account_id
    fill_in "Category", with: @expense.category_id
    fill_in "Category type", with: @expense.category_type_id
    fill_in "Comment", with: @expense.comment
    fill_in "Concept", with: @expense.concept
    fill_in "Date", with: @expense.date
    fill_in "Deleted at", with: @expense.deleted_at
    fill_in "Document type", with: @expense.document_type_id
    fill_in "Folio", with: @expense.folio
    fill_in "Last digit", with: @expense.last_digit
    fill_in "Payment method", with: @expense.payment_method_id
    fill_in "Project", with: @expense.project
    fill_in "Provider", with: @expense.provider_id
    fill_in "Purchase order", with: @expense.purchase_order
    click_on "Update Expense"

    assert_text "Expense was successfully updated"
    click_on "Back"
  end

  test "destroying a Expense" do
    visit expenses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expense was successfully destroyed"
  end
end
