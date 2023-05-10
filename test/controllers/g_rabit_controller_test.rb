require 'test_helper'

class GRabitControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get g_rabit_home_url
    assert_response :success
  end

end
