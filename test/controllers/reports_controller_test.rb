require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get quotations_total" do
    get reports_quotations_total_url
    assert_response :success
  end

end
