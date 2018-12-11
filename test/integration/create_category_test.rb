
require 'test_helper'

class CreateCategoryTest <  ActionDispatch::IntegrationTest
  
  
  def setup
    @user = User.create(username: "chris", email: "chris09@example.com", password: "123", admin:true)
  end
  
  test "get new category form and create category" do
    
    sign_in_as(@user, "123")
    
    get new_category_path
    
    assert_template 'categories/new'
    
    assert_difference 'Category.count', 1 do
      
      post categories_path, params: {category: {name: "sports"}}
      
      follow_redirect!
      
    end
    
    assert_template 'categories/index'
    
    assert_match 'sports', response.body 
    
  end
  
  test "create invalid category" do
    
    sign_in_as(@user, "123")
    
    get new_category_path
    
    assert_template 'categories/new'
    
    assert_no_difference 'Category.count' do
      
      
      post categories_path, params: {category: {name: " "}}
      
    end
    
    assert_template 'categories/new'
    
    assert_select 'h2.panel-title'
    
    assert_select 'div.panel-body'
    
  end
  
  test "create category if not logged in" do 
    
    
    assert_no_difference 'Category.count' do
      
      post categories_path, params: {category: {name: "sports"}}  
      
    end
    
    assert_redirected_to categories_path    
    
  end
  

  

end