require "test_helper"

class FormBackControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get form_back_new_url
    assert_response :success
  end
end
