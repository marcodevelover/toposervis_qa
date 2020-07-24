require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expense = expenses(:one)
  end

  test "should get index" do
    get expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_expense_url
    assert_response :success
  end

  test "should create expense" do
    assert_difference('Expense.count') do
      post expenses_url, params: { expense: { account_id: @expense.account_id, category_id: @expense.category_id, category_type_id: @expense.category_type_id, comment: @expense.comment, concept: @expense.concept, date: @expense.date, deleted_at: @expense.deleted_at, document_type_id: @expense.document_type_id, folio: @expense.folio, last_digit: @expense.last_digit, payment_method_id: @expense.payment_method_id, project: @expense.project, provider_id: @expense.provider_id, purchase_order: @expense.purchase_order } }
    end

    assert_redirected_to expense_url(Expense.last)
  end

  test "should show expense" do
    get expense_url(@expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_expense_url(@expense)
    assert_response :success
  end

  test "should update expense" do
    patch expense_url(@expense), params: { expense: { account_id: @expense.account_id, category_id: @expense.category_id, category_type_id: @expense.category_type_id, comment: @expense.comment, concept: @expense.concept, date: @expense.date, deleted_at: @expense.deleted_at, document_type_id: @expense.document_type_id, folio: @expense.folio, last_digit: @expense.last_digit, payment_method_id: @expense.payment_method_id, project: @expense.project, provider_id: @expense.provider_id, purchase_order: @expense.purchase_order } }
    assert_redirected_to expense_url(@expense)
  end

  test "should destroy expense" do
    assert_difference('Expense.count', -1) do
      delete expense_url(@expense)
    end

    assert_redirected_to expenses_url
  end
end
