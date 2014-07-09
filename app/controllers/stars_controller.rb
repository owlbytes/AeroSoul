class StarsController < ApplicationController

  def index
    @top_posts = User.find(params[:user_id]).starred_posts
  end

  def create
    @star = current_user.stars.create(post_id: params[:post_id])
    redirect_to user_stars_path(current_user)
  end
end




# def star
#     @post = Post.find(params[:id])
#     @star = @post.stars.find_by_user_id(current_user.id) 


#     if @star.present?
#     # if star present  unstar the post
#       if @star.destroy

#         redirect_to :back, notice: "This was removed from your favorites." 
#       else
#         redirect_to :back, alert: "Something went wrong!"
#       end

#     else
#       #else star the post
#       @star = Star.new(:user => current_user, :post => @post)

#       #record instance of star
#       if @star.save
#         redirect_to :back, notice: "This is added to your favorites." 
#       else
#         redirect_to :back, alert: "Something went wrong!"
#       end

