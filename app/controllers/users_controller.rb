class UsersController < ApplicationController 

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    user = User.create params[:user]
    UserMailer.registration_confirmation(@user).deliver
    #passing the argument “@user”, to which the “registration_confirmation” will be sent to.
 
    redirect_to user

  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update_attributes params[:user]
    redirect_to user
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to users_path
  end

  def favourites
    fav_posts = current_user.destring(current_user)
    @top_posts = []
    fav_posts.each do |n|
      post = Post.find(n)
      @top_posts << post
    end
    render :favorites
  end

  def my_posts
    @posts = Post.where(user_id: current_user)
  end
end