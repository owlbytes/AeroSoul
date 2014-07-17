class AdminController < ApplicationController

  def index
    @posts = Post.all
    @users = User.all
    # @post = Post.find params[:id]
  end 

end