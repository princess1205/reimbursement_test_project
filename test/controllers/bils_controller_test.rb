require 'test_helper'

class BilsControllerTest < ActionDispatch::IntegrationTest
  test "should get get_bils_list" do
    get bils_get_bils_list_url
    assert_response :success
  end

end
