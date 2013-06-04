require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  test "index shows all posts" do
    p1 = Post.create(:content => 'foo', :title => 'a')
    p2 = Post.create(:content => 'boo', :title => 'b')
    
    get :index
    assert_select '.post', :count => 2
  end
  
  test "showing a single post" do
    p = Post.create(:content => 'boo', :title => 'c')
    get :show, :id => p
    assert_select '.post-content', :text => 'boo'
  end

  test "creating a post" do
    post :create, :post => {:content => 'boo', :title => 'd'}
    assert_redirected_to posts_path
    assert_equal 1, Post.count
  end

  test "creating a post by means of a callback" do
    post :status_callback, "build_result" => "passed", 
                           "counter" => 1, 
                           "project_name" => "goci/x-sample-rails-app-pg",
                           "stage_name" => "Integration"
    
    assert_equal 1, Post.count
  end

  test "getting a post form" do
    get :new
    assert_template 'new'
  end
end