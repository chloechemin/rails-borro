class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end
end

  private

  def post_params
    params.require(:post).permit(:category, :title, :location, :description, :duration, :owner_id)
  end
