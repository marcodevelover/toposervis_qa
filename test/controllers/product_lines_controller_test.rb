require 'test_helper'

class ProductLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_line = product_lines(:one)
  end

  test "should get index" do
    get product_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_product_line_url
    assert_response :success
  end

  test "should create product_line" do
    assert_difference('ProductLine.count') do
      post product_lines_url, params: { product_line: { deleted_at: @product_line.deleted_at, description: @product_line.description, name: @product_line.name } }
    end

    assert_redirected_to product_line_url(ProductLine.last)
  end

  test "should show product_line" do
    get product_line_url(@product_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_line_url(@product_line)
    assert_response :success
  end

  test "should update product_line" do
    patch product_line_url(@product_line), params: { product_line: { deleted_at: @product_line.deleted_at, description: @product_line.description, name: @product_line.name } }
    assert_redirected_to product_line_url(@product_line)
  end

  test "should destroy product_line" do
    assert_difference('ProductLine.count', -1) do
      delete product_line_url(@product_line)
    end

    assert_redirected_to product_lines_url
  end
end
