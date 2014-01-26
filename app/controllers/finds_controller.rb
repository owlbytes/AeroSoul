class FindsController < ApplicationController
  def index
    query_terms = params[:query].split.join("|")
    @posts = Post.advanced_search query_terms
  end

end