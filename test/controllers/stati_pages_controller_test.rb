require "test_helper"

class StatiPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get stati_pages_home_url
    assert_response :success
  end
end
