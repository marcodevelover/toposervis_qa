require 'test_helper'

class PaymentWaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_way = payment_ways(:one)
  end

  test "should get index" do
    get payment_ways_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_way_url
    assert_response :success
  end

  test "should create payment_way" do
    assert_difference('PaymentWay.count') do
      post payment_ways_url, params: { payment_way: { deleted_at: @payment_way.deleted_at, description: @payment_way.description, name: @payment_way.name } }
    end

    assert_redirected_to payment_way_url(PaymentWay.last)
  end

  test "should show payment_way" do
    get payment_way_url(@payment_way)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_way_url(@payment_way)
    assert_response :success
  end

  test "should update payment_way" do
    patch payment_way_url(@payment_way), params: { payment_way: { deleted_at: @payment_way.deleted_at, description: @payment_way.description, name: @payment_way.name } }
    assert_redirected_to payment_way_url(@payment_way)
  end

  test "should destroy payment_way" do
    assert_difference('PaymentWay.count', -1) do
      delete payment_way_url(@payment_way)
    end

    assert_redirected_to payment_ways_url
  end
end
