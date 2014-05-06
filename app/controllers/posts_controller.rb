class PostsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @mapposts = Post.all
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).find_with_reputation(:votes, :all, order: "votes desc")
    else
      @posts = Post.find_with_reputation(:votes, :all, order: "votes desc")
    end 
    
    #when making a request, this outlines how the server will respond. Used in conjunction with google maps (to show data points) and infinite scroll (.js)
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @mapposts }
    end
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
    # @post.add_or_update_evaluation(:votes, value, current_user)
    @post.record_vote_of_user(current_user, value)
    redirect_to posts_path, notice: "Thank you for voting"
  end

  def assign_favorite_post
    curr_user = User.find(current_user.id)
    fav_posts = curr_user.destring(curr_user)
    respond_to do |format|
      if fav_posts.include?(params[:id].to_i)
        format.html { redirect_to favourites_user_path, notice: "That post is already on of your favoorites!" }
      else
        fav_posts.push(params[:id].to_i)
        curr_user.fav_posts = fav_posts.to_s        
        curr_user.save
        format.html { redirect_to favourites_user_path, notice: "You've added to your favoorites." }
      end
    end
  end

end


