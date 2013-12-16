class PostsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    if params[:tag]
    @top_posts = Post.tagged_with(params[:tag])
    @posts = []
    else
    @top_posts = Post.order("score DESC")
    @posts = Post.all
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
    post = Post.create params[:post]
    @post.score = 0
    @post.upvoters = "[-1]"
    @post.downvoters = "[-2]"
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

  def vote
    @post = Post.find(params[:id])
    @upvoters, @downvoters = @post.deserialize(@post) #converts upvoters and downvoters from strings to arrays

    #logic for upvotes
    if (@upvoters.include? current_user.id) && (params[:score] == "1") then
      @post.score -= 1 
      @upvoters.delete(current_user.id)
    elsif (@upvoters.include? current_user.id) && (params[:score] == "-1") then
      @post.score -= 2
      @upvoters.delete(current_user.id)
      @downvoters.push(current_user.id)
    elsif (@downvoters.include? current_user.id) && (params[:score] == "1") then
      @post.score += 2
      @downvoters.delete(current_user.id)
      @upvoters.push(current_user.id)
    elsif (@downvoters.include? current_user.id) && (params[:score] == "-1") then
      @post.score += 1
      @downvoters.delete(current_user.id)
    elsif !(@downvoters.include? current_user.id) && !(@upvoters.include? current_user.id) then
      case params[:score]
      when "-1"
        @post.score -= 1
        @downvoters << current_user.id
      when "1"
        @post.score += 1
        @upvoters << current_user.id
      end
    end
    
    @post.upvoters = @upvoters.to_s
    @post.downvoters = @downvoters.to_s
    respond_to do |format|
      if @post.save
        if params[:returnto] == "index"
          format.html { redirect_to posts_path, notice: "You've voted! Thanks." }
        else
          format.html { redirect_to @post, notice: "You've voted! Thanks." }
        end
      else
        format.html { redirect_to @post, notice: "Oops something went wrong, please try again" }
      end
    end
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


