require 'test_helper'

class DiagnosisTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diagnosis_type = diagnosis_types(:one)
  end

  test "should get index" do
    get diagnosis_types_url
    assert_response :success
  end

  test "should get new" do
    get new_diagnosis_type_url
    assert_response :success
  end

  test "should create diagnosis_type" do
    assert_difference('DiagnosisType.count') do
      post diagnosis_types_url, params: { diagnosis_type: { deleted_at: @diagnosis_type.deleted_at, description: @diagnosis_type.description, name: @diagnosis_type.name } }
    end

    assert_redirected_to diagnosis_type_url(DiagnosisType.last)
  end

  test "should show diagnosis_type" do
    get diagnosis_type_url(@diagnosis_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_diagnosis_type_url(@diagnosis_type)
    assert_response :success
  end

  test "should update diagnosis_type" do
    patch diagnosis_type_url(@diagnosis_type), params: { diagnosis_type: { deleted_at: @diagnosis_type.deleted_at, description: @diagnosis_type.description, name: @diagnosis_type.name } }
    assert_redirected_to diagnosis_type_url(@diagnosis_type)
  end

  test "should destroy diagnosis_type" do
    assert_difference('DiagnosisType.count', -1) do
      delete diagnosis_type_url(@diagnosis_type)
    end

    assert_redirected_to diagnosis_types_url
  end
end
