require 'test_helper'

class AuthorControllerTest < ActionController::TestCase
  test "should get session" do
    get :session
    assert_response :success
  end

end
