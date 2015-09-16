require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get Home" do
    get :Home
    assert_response :success
  end

  test "should get Login" do
    get :Login
    assert_response :success
  end

  test "should get Explore" do
    get :Explore
    assert_response :success
  end

  test "should get About" do
    get :About
    assert_response :success
  end
  
  test "should get Books" do
    get :Books
    assert_response :success
  end
  
  test "should get Poetry" do
    get :Poetry
    assert_response :success
  end
  
end
