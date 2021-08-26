require 'test_helper'

class LendingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lending = lendings(:one)
  end

  test "should get index" do
    get lendings_url
    assert_response :success
  end

  test "should get new" do
    get new_lending_url
    assert_response :success
  end

  test "should create lending" do
    assert_difference('Lending.count') do
      post lendings_url, params: { lending: { adjustment_total: @lending.adjustment_total, created_by_id: @lending.created_by_id, currency_id: @lending.currency_id, date: @lending.date, deleted_at: @lending.deleted_at, description: @lending.description, entry_code_id: @lending.entry_code_id, exchange_rate: @lending.exchange_rate, folio: @lending.folio, name: @lending.name, observation: @lending.observation, provider_id: @lending.provider_id, receipt_type_id: @lending.receipt_type_id, responsible: @lending.responsible, state: @lending.state, subtotal: @lending.subtotal, tax: @lending.tax, tax_item_total: @lending.tax_item_total, tax_total: @lending.tax_total, total: @lending.total, validity: @lending.validity } }
    end

    assert_redirected_to lending_url(Lending.last)
  end

  test "should show lending" do
    get lending_url(@lending)
    assert_response :success
  end

  test "should get edit" do
    get edit_lending_url(@lending)
    assert_response :success
  end

  test "should update lending" do
    patch lending_url(@lending), params: { lending: { adjustment_total: @lending.adjustment_total, created_by_id: @lending.created_by_id, currency_id: @lending.currency_id, date: @lending.date, deleted_at: @lending.deleted_at, description: @lending.description, entry_code_id: @lending.entry_code_id, exchange_rate: @lending.exchange_rate, folio: @lending.folio, name: @lending.name, observation: @lending.observation, provider_id: @lending.provider_id, receipt_type_id: @lending.receipt_type_id, responsible: @lending.responsible, state: @lending.state, subtotal: @lending.subtotal, tax: @lending.tax, tax_item_total: @lending.tax_item_total, tax_total: @lending.tax_total, total: @lending.total, validity: @lending.validity } }
    assert_redirected_to lending_url(@lending)
  end

  test "should destroy lending" do
    assert_difference('Lending.count', -1) do
      delete lending_url(@lending)
    end

    assert_redirected_to lendings_url
  end
end
