require 'test_helper'

class EntryCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry_code = entry_codes(:one)
  end

  test "should get index" do
    get entry_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_entry_code_url
    assert_response :success
  end

  test "should create entry_code" do
    assert_difference('EntryCode.count') do
      post entry_codes_url, params: { entry_code: { deleted_at: @entry_code.deleted_at, description: @entry_code.description, name: @entry_code.name } }
    end

    assert_redirected_to entry_code_url(EntryCode.last)
  end

  test "should show entry_code" do
    get entry_code_url(@entry_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_entry_code_url(@entry_code)
    assert_response :success
  end

  test "should update entry_code" do
    patch entry_code_url(@entry_code), params: { entry_code: { deleted_at: @entry_code.deleted_at, description: @entry_code.description, name: @entry_code.name } }
    assert_redirected_to entry_code_url(@entry_code)
  end

  test "should destroy entry_code" do
    assert_difference('EntryCode.count', -1) do
      delete entry_code_url(@entry_code)
    end

    assert_redirected_to entry_codes_url
  end
end
