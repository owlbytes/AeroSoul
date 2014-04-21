class PostsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @posts = Post.all
    #for acts_as_taggable
    @tag = params[:tag] 

    @posts = Post.find_with_reputation(:votes, :all, order: "votes desc")
    
    #when making a request, this outlines how the server will respond. Used in conjunction with google maps (to show data points) and infinite scroll (.js)
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @mapposts }
    end
  end

  def tag


  end

    
  def show
    @post = Post.find params[:id]
    authorize! :read, @post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create params[:post]
    @post.upvoters = "[-1]"
    @post.downvoters = "[-2]"
    if @post.save
      redirect_to @post, notice: 'Post was successfully created!'
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
    flash[:alert] = "Post was destroyed!"
    redirect_to posts_path 
  end

  def flag
    @post.flagged = true
    @post.save
    flash[:notice] = 'Post was flagged!'
    render :show
  end

  def flagged
    @posts = Post.where(:flagged => true).all
    render :index
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @post = Post.find(params[:id])
    @post.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :index, notice: "Thank you for voting"
  end

  def assign_favorite_post
    fav_posts = current_user.destring(current_user)
    respond_to do |format|
      if fav_posts.include?(params[:id].to_i)
        format.html { redirect_to favourites_user_path, notice: "That post is already on of your favorites!" }
      else
        fav_posts.push(params[:id].to_i)
        current_user.fav_posts = fav_posts.to_s        
        current_user.save
        format.html { redirect_to favourites_user_path, notice: "This is added to your favorites." }
      end
    end
  end

end


