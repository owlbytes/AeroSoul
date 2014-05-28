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

  def star
    
    @post = Post.find(params[:id])
    @star = @post.stars.find_by_user_id(current_user.id) 


    if @star.present?
    # if star present  unstar the post
      if @star.destroy

        redirect_to :back, notice: "This is removed to your favorites." 
      else
        redirect_to :back, alert: "Something went wrong!"
      end

    else
      #else star the post
      @star = Star.new(:user => current_user, :post => @post)

      #record instance of star
      if @star.save
        redirect_to :back, notice: "This is added to your favorites." 
      else
        redirect_to :back, alert: "Something went wrong!"
      end

    end 
  end

end


