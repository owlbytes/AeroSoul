class PostsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @posts = Post.all 
  end

  def show
    @post = Post.find params[:id]
    authorize! :read, @post
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create params[:post]
    if @post.save
      redirect_to post, notice: 'Post was successfully created!'
    else
      flash[:alert] = 'Post was NOT created!'
      render :new
    end 
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    if @post.update_attributes(params[:post])
      redirect_to @post, notice: 'Post was successfully updated!'
    else
      flash[:alert] = 'Post was NOT updated!'
      render :edit
    end
  end

  def destroy
    post = Post.find params[:id]
    post.delete
    redirect_to posts_path 
  end

  def flag
    @post.flagged = true
    @post.save
    flash[:notice] = 'Recipe was flagged!'
    render :show
  end

  def flagged
    @posts = Recipe.where(:flagged => true).all
    render :index
  end

end