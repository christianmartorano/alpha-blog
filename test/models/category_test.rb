require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    @category = Category.new(name: "sports")
  end
  
  test "category just be valid" do
    assert @category.valid?
  end
  
  test "category save blank?" do
    @category.name = " "
    assert_not @category.valid?
  end
  
  test "category must be uniq" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end
  
  test "category is to short" do
    @category = Category.new(name: "a")
    assert_not @category.valid?
  end
  
  test "category is to long" do
     @category = Category.new(name: "a" * 26)
    assert_not @category.valid?
  end
  
end