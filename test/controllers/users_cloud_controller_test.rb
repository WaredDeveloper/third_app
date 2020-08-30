require 'test_helper'

class UsersCloudControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_cloud_new_url
    assert_response :success
  end

end
