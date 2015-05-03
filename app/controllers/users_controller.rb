class UsersController < ApplicationController 

  def index
    @users = User.all
    @users = User.paginate(:page => params[:page], :per_page => 9).find(:all, order: "posts_count desc")
  end

  def show
    @user = User.find params[:id]
    @user_posts = @user.posts
  end

  def new
    @user = User.new
    user.save
  end

  def create
    user = User.create params[:user]
    user.role = "user"
    user.save
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

  def my_posts
    @posts = Post.where(user_id: current_user)
  end
end