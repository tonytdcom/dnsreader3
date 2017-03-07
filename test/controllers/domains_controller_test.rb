require 'test_helper'

class DomainsControllerTest < ActionController::TestCase
  test "should get scans" do
    get :scans
    assert_response :success
  end

end
