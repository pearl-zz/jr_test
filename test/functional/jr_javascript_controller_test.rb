require 'test_helper'

class JrJavascriptControllerTest < ActionController::TestCase
  tests Jr::JavascriptController
  
  setup do
    @bob = accounts(:bob)
    @alice = accounts(:alice)
  end

  test "should get correct static javascript" do
    get :static_javascript
    assert_response :success
    
    expected_body = "\n/**\n * PREAMBLE\n **/\n\n/** \n* The constructor for this model. You are free to add any\n* customization logic here. \n* Note: Do not invoke this directly. Rather use: Account.create(...)\n*/\nfunction Account() {};\n\nModelUtils.acts_as_model(Account, {\n  fields: [{name: 'name'},{name: 'login'},{name: 'email'},{name: 'id'},{name: 'updated_at'}]\n});\n\nModelUtils.has_many(Account, Comment, 'comments', {})\n\nModelUtils.has_many(Account, Post, 'posts', {})\n\n/** \n* The constructor for this model. You are free to add any\n* customization logic here. \n* Note: Do not invoke this directly. Rather use: Comment.create(...)\n*/\nfunction Comment() {};\n\nModelUtils.acts_as_model(Comment, {\n  fields: [{name: 'message'},{name: 'id'},{name: 'updated_at'}]\n});\n\n/** \n* The constructor for this model. You are free to add any\n* customization logic here. \n* Note: Do not invoke this directly. Rather use: Post.create(...)\n*/\nfunction Post() {};\n\nModelUtils.acts_as_model(Post, {\n  fields: [{name: 'message'},{name: 'id'},{name: 'updated_at'}]\n});\n\n/** \n* The constructor for this model. You are free to add any\n* customization logic here. \n* Note: Do not invoke this directly. Rather use: Account.create(...)\n*/\nfunction Account() {};\n\nModelUtils.acts_as_model(Account, {\n  fields: [{name: 'name'},{name: 'login'},{name: 'email'},{name: 'id'},{name: 'updated_at'}]\n});\n\nModelUtils.has_many(Account, Comment, 'comments', {})\n\nModelUtils.has_many(Account, Post, 'posts', {})\n\n/** \n* The constructor for this model. You are free to add any\n* customization logic here. \n* Note: Do not invoke this directly. Rather use: Comment.create(...)\n*/\nfunction Comment() {};\n\nModelUtils.acts_as_model(Comment, {\n  fields: [{name: 'message'},{name: 'id'},{name: 'updated_at'}]\n});\n\n/** \n* The constructor for this model. You are free to add any\n* customization logic here. \n* Note: Do not invoke this directly. Rather use: Post.create(...)\n*/\nfunction Post() {};\n\nModelUtils.acts_as_model(Post, {\n  fields: [{name: 'message'},{name: 'id'},{name: 'updated_at'}]\n});\n"
    actual_body = "#{@response.body}"
    assert_equal expected_body, actual_body

  end
  
  
  
  # 
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  # 
  # test "should create goal" do
  #   assert_difference('Goal.count') do
  #     post :create, :goal => @goal.attributes
  #   end
  # 
  #   assert_redirected_to goal_path(assigns(:goal))
  # end
  # 
  # test "should show goal" do
  #   get :show, :id => @goal.to_param
  #   assert_response :success
  # end
  # 
  # test "should get edit" do
  #   get :edit, :id => @goal.to_param
  #   assert_response :success
  # end
  # 
  # test "should update goal" do
  #   put :update, :id => @goal.to_param, :goal => @goal.attributes
  #   assert_redirected_to goal_path(assigns(:goal))
  # end
  # 
  # test "should destroy goal" do
  #   assert_difference('Goal.count', -1) do
  #     delete :destroy, :id => @goal.to_param
  #   end
  # 
  #   assert_redirected_to goals_path
  # end
end
