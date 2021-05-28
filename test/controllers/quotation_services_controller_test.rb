require 'test_helper'

class QuotationServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quotation_service = quotation_services(:one)
  end

  test "should get index" do
    get quotation_services_url
    assert_response :success
  end

  test "should get new" do
    get new_quotation_service_url
    assert_response :success
  end

  test "should create quotation_service" do
    assert_difference('QuotationService.count') do
      post quotation_services_url, params: { quotation_service: { adjustment_total: @quotation_service.adjustment_total, canceled_at: @quotation_service.canceled_at, condition: @quotation_service.condition, created_by_id: @quotation_service.created_by_id, currency_id: @quotation_service.currency_id, customer_id: @quotation_service.customer_id, exchange_rate: @quotation_service.exchange_rate, item_total: @quotation_service.item_total, number: @quotation_service.number, state: @quotation_service.state, tax: @quotation_service.tax, tax_item_total: @quotation_service.tax_item_total, tax_total: @quotation_service.tax_total, total: @quotation_service.total, validity: @quotation_service.validity } }
    end

    assert_redirected_to quotation_service_url(QuotationService.last)
  end

  test "should show quotation_service" do
    get quotation_service_url(@quotation_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_quotation_service_url(@quotation_service)
    assert_response :success
  end

  test "should update quotation_service" do
    patch quotation_service_url(@quotation_service), params: { quotation_service: { adjustment_total: @quotation_service.adjustment_total, canceled_at: @quotation_service.canceled_at, condition: @quotation_service.condition, created_by_id: @quotation_service.created_by_id, currency_id: @quotation_service.currency_id, customer_id: @quotation_service.customer_id, exchange_rate: @quotation_service.exchange_rate, item_total: @quotation_service.item_total, number: @quotation_service.number, state: @quotation_service.state, tax: @quotation_service.tax, tax_item_total: @quotation_service.tax_item_total, tax_total: @quotation_service.tax_total, total: @quotation_service.total, validity: @quotation_service.validity } }
    assert_redirected_to quotation_service_url(@quotation_service)
  end

  test "should destroy quotation_service" do
    assert_difference('QuotationService.count', -1) do
      delete quotation_service_url(@quotation_service)
    end

    assert_redirected_to quotation_services_url
  end
end
