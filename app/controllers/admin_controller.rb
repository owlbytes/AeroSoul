class AdminController < ApplicationController

  def index
    @posts = Post.all
    @users = User.all
    # @post = Post.find params[:id]
    @user = current_user
  end 

end




# def index
#     @mapposts = Post.all
#     if params[:tag]
#       @posts = Post.tagged_with(params[:tag]).find_with_reputation(:votes, :all, order: "votes desc")
#     else
#       @posts = Post.find_with_reputation(:votes, :all, order: "votes desc")
#     end 
    
#     #when making a request, this outlines how the server will respond. Used in conjunction with google maps (to show data points) and infinite scroll (.js)
#     respond_to do |format|
#       format.html
#       format.js
#       format.json { render json: @mapposts }
#     end
#   end

#   def tag
#   end

    
#   def show
#     @post = Post.find params[:id]
#     authorize! :read, @post
#     @star = @post.stars.find_by_user_id(current_user.id)  if user_signed_in?
#   end