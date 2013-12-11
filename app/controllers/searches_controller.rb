class SearchesController < ApplicationController
  def create
    query_terms = params[:query].split.join("|")
    @posts = Post.advanced_search query_terms
    render :index
  end 
end