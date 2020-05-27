require 'test_helper'

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase = purchases(:one)
  end

  test "should get index" do
    get purchases_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_url
    assert_response :success
  end

  test "should create purchase" do
    assert_difference('Purchase.count') do
      post purchases_url, params: { purchase: { adjustment_total: @purchase.adjustment_total, created_by_id: @purchase.created_by_id, currency_id: @purchase.currency_id, date: @purchase.date, deleted_at: @purchase.deleted_at, entry_code_id: @purchase.entry_code_id, exchange_rate: @purchase.exchange_rate, folio: @purchase.folio, item_total: @purchase.item_total, observation: @purchase.observation, provider_id: @purchase.provider_id, receipt_type_id: @purchase.receipt_type_id, state: @purchase.state, tax: @purchase.tax, tax_item_total: @purchase.tax_item_total, tax_total: @purchase.tax_total, total: @purchase.total, validity: @purchase.validity } }
    end

    assert_redirected_to purchase_url(Purchase.last)
  end

  test "should show purchase" do
    get purchase_url(@purchase)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_url(@purchase)
    assert_response :success
  end

  test "should update purchase" do
    patch purchase_url(@purchase), params: { purchase: { adjustment_total: @purchase.adjustment_total, created_by_id: @purchase.created_by_id, currency_id: @purchase.currency_id, date: @purchase.date, deleted_at: @purchase.deleted_at, entry_code_id: @purchase.entry_code_id, exchange_rate: @purchase.exchange_rate, folio: @purchase.folio, item_total: @purchase.item_total, observation: @purchase.observation, provider_id: @purchase.provider_id, receipt_type_id: @purchase.receipt_type_id, state: @purchase.state, tax: @purchase.tax, tax_item_total: @purchase.tax_item_total, tax_total: @purchase.tax_total, total: @purchase.total, validity: @purchase.validity } }
    assert_redirected_to purchase_url(@purchase)
  end

  test "should destroy purchase" do
    assert_difference('Purchase.count', -1) do
      delete purchase_url(@purchase)
    end

    assert_redirected_to purchases_url
  end
end
