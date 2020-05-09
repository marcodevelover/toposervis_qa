require 'test_helper'

class QuotationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quotation = quotations(:one)
  end

  test "should get index" do
    get quotations_url
    assert_response :success
  end

  test "should get new" do
    get new_quotation_url
    assert_response :success
  end

  test "should create quotation" do
    assert_difference('Quotation.count') do
      post quotations_url, params: { quotation: { adjustment_total: @quotation.adjustment_total, deleted_at: @quotation.deleted_at, condition: @quotation.condition, created_by_id: @quotation.created_by_id, currency_id: @quotation.currency_id, customer_id: @quotation.customer_id, exchange_rate: @quotation.exchange_rate, item_total: @quotation.item_total, number: @quotation.number, state: @quotation.state, tax: @quotation.tax, tax_item_total: @quotation.tax_item_total, tax_total: @quotation.tax_total, total: @quotation.total, validity: @quotation.validity } }
    end

    assert_redirected_to quotation_url(Quotation.last)
  end

  test "should show quotation" do
    get quotation_url(@quotation)
    assert_response :success
  end

  test "should get edit" do
    get edit_quotation_url(@quotation)
    assert_response :success
  end

  test "should update quotation" do
    patch quotation_url(@quotation), params: { quotation: { adjustment_total: @quotation.adjustment_total, deleted_at: @quotation.deleted_at, condition: @quotation.condition, created_by_id: @quotation.created_by_id, currency_id: @quotation.currency_id, customer_id: @quotation.customer_id, exchange_rate: @quotation.exchange_rate, item_total: @quotation.item_total, number: @quotation.number, state: @quotation.state, tax: @quotation.tax, tax_item_total: @quotation.tax_item_total, tax_total: @quotation.tax_total, total: @quotation.total, validity: @quotation.validity } }
    assert_redirected_to quotation_url(@quotation)
  end

  test "should destroy quotation" do
    assert_difference('Quotation.count', -1) do
      delete quotation_url(@quotation)
    end

    assert_redirected_to quotations_url
  end
end
