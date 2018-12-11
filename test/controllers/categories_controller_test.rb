require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  
  def setup 
    @user = User.create(username: "chris", password: "1234", email: "chris@example.com", admin: true)
    @category = Category.create(name: "sports")
  end
  
  test "should be new" do
    sign_in_as(@user, "1234")
    get new_category_path
    assert_response :success
  end
  
  test "should be index" do
    get categories_path
    assert_response :success
  end
  
  test "should be show" do
    get category_path(@category)
    assert_response :success
  end
  
end