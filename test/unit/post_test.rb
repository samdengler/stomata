require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "create a post" do
    p = Post.create(:content => 'trivial', :title => "foo")
    assert_equal 1, Post.count
    assert_equal 'trivial', p.content
  end

  test "copy self over" do
    FileUtils.mkdir_p("artifats/interesting")
    File.open("artifats/interesting/post_test.rb", 'w') do |f|
      f << File.readlines(File.expand_path(__FILE__)).join("\n")
    end
  end
end