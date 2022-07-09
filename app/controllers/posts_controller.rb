class PostsController < ApplicationController

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params[:post])
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:category, :title, :description, :location, :duration, :owner_id)
  end

end
