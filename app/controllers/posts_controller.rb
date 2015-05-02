class PostsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @mapposts = Post.all
    if params[:tag]
      # @posts = Post.tagged_with(params[:tag]).sort_by{|p| p.live}
      @posts = Post.tagged_with(params[:tag]).find_with_reputation(:scores, :all, order: "scores desc")
    else
      # @posts = Post.sort_by{|p| p.live}
      @posts = Post.find_with_reputation(:scores, :all, order: "score desc")
    end 
    
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
    @star = @post.stars.find_by_user_id(current_user.id)  if user_signed_in?
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create params[:post]
    # @post.valid?
    # raise @post.errors.inspect
    if @post.save!
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
      if request.xhr?
        render json: @post
      else redirect_to @post, notice: 'Post was successfully updated!'
      end
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



end


