class SearchController < ApplicationController
  def result
    @posts = Post.all
  end
end
