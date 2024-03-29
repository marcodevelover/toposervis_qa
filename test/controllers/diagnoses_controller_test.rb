require 'test_helper'

class DiagnosesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diagnosis = diagnoses(:one)
  end

  test "should get index" do
    get diagnoses_url
    assert_response :success
  end

  test "should get new" do
    get new_diagnosis_url
    assert_response :success
  end

  test "should create diagnosis" do
    assert_difference('Diagnosis.count') do
      post diagnoses_url, params: { diagnosis: { date: @diagnosis.date, date_delivery: @diagnosis.date_delivery, delivery_time: @diagnosis.delivery_time, diagnosis_type_id: @diagnosis.diagnosis_type_id, service_order_id: @diagnosis.service_order_id } }
    end

    assert_redirected_to diagnosis_url(Diagnosis.last)
  end

  test "should show diagnosis" do
    get diagnosis_url(@diagnosis)
    assert_response :success
  end

  test "should get edit" do
    get edit_diagnosis_url(@diagnosis)
    assert_response :success
  end

  test "should update diagnosis" do
    patch diagnosis_url(@diagnosis), params: { diagnosis: { date: @diagnosis.date, date_delivery: @diagnosis.date_delivery, delivery_time: @diagnosis.delivery_time, diagnosis_type_id: @diagnosis.diagnosis_type_id, service_order_id: @diagnosis.service_order_id } }
    assert_redirected_to diagnosis_url(@diagnosis)
  end

  test "should destroy diagnosis" do
    assert_difference('Diagnosis.count', -1) do
      delete diagnosis_url(@diagnosis)
    end

    assert_redirected_to diagnoses_url
  end
end
