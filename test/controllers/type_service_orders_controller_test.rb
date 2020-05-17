require 'test_helper'

class TypeServiceOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_service_order = type_service_orders(:one)
  end

  test "should get index" do
    get type_service_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_type_service_order_url
    assert_response :success
  end

  test "should create type_service_order" do
    assert_difference('TypeServiceOrder.count') do
      post type_service_orders_url, params: { type_service_order: { deleted_at: @type_service_order.deleted_at, description: @type_service_order.description, name: @type_service_order.name } }
    end

    assert_redirected_to type_service_order_url(TypeServiceOrder.last)
  end

  test "should show type_service_order" do
    get type_service_order_url(@type_service_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_service_order_url(@type_service_order)
    assert_response :success
  end

  test "should update type_service_order" do
    patch type_service_order_url(@type_service_order), params: { type_service_order: { deleted_at: @type_service_order.deleted_at, description: @type_service_order.description, name: @type_service_order.name } }
    assert_redirected_to type_service_order_url(@type_service_order)
  end

  test "should destroy type_service_order" do
    assert_difference('TypeServiceOrder.count', -1) do
      delete type_service_order_url(@type_service_order)
    end

    assert_redirected_to type_service_orders_url
  end
end
