require 'test_helper'

class BillPaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bill_payment_index_url
    assert_response :success
  end

end
