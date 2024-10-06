require "test_helper"

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get doctors_new_url
    assert_response :success
  end

  test "should get create" do
    get doctors_create_url
    assert_response :success
  end

  test "should get destroy" do
    get doctors_destroy_url
    assert_response :success
  end
end
