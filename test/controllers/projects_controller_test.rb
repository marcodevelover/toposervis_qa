require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { adjustment_total: @project.adjustment_total, created_by_id: @project.created_by_id, currency_id: @project.currency_id, date: @project.date, deleted_at: @project.deleted_at, description: @project.description, entry_code_id: @project.entry_code_id, exchange_rate: @project.exchange_rate, folio: @project.folio, name: @project.name, observation: @project.observation, provider_id: @project.provider_id, receipt_type_id: @project.receipt_type_id, state: @project.state, subtotal: @project.subtotal, tax: @project.tax, tax_item_total: @project.tax_item_total, tax_total: @project.tax_total, total: @project.total, validity: @project.validity } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { adjustment_total: @project.adjustment_total, created_by_id: @project.created_by_id, currency_id: @project.currency_id, date: @project.date, deleted_at: @project.deleted_at, description: @project.description, entry_code_id: @project.entry_code_id, exchange_rate: @project.exchange_rate, folio: @project.folio, name: @project.name, observation: @project.observation, provider_id: @project.provider_id, receipt_type_id: @project.receipt_type_id, state: @project.state, subtotal: @project.subtotal, tax: @project.tax, tax_item_total: @project.tax_item_total, tax_total: @project.tax_total, total: @project.total, validity: @project.validity } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
