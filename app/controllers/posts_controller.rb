class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    Post.create(params[:post])
    redirect_to posts_path
  end

  def show
    post = Post.find(params[:id])
    render '_show', :locals => {:post => post}
  end

  def status_callback
    post = Post.create(:title => "#{params['project_name']} - #{params['build_result']}", :content => "The #{params['stage_name']} stage #{params['build_result']}" )
    head (post.errors.any? ? :unprocessable_entity : :ok)
  end

end