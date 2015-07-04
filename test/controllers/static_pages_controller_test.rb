require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get guestls" do
    get :guestls
    assert_response :success
  end

  test "should get roomls" do
    get :roomls
    assert_response :success
  end

end
