class PostsController < ApplicationController
  def index
    @posts = Post.all 
  end

  def show
    @post = Post.find params [:id]
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create params[:post]
    redirect_to post 
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    post.update_attributes params[:post]
    redirect_to post
  end

  def post
    post = Post.find params[:id]
    post.delete
    redirect_to posts_path 
  end
end