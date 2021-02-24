require "test_helper"

class SelfContrControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get self_contr_home_url
    assert_response :success
  end
end
