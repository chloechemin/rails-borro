class PostsController < ApplicationController

  def index
    @posts = Post.all
    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        info_window: render_to_string(partial: "info_window", locals: { post: post }),
        image_url: post.category == 'product' ? helpers.asset_url("Pin-thingstoborrow.png") : helpers.asset_url("Pin-service.png")
      }
    end
  end

  def show
    @post = Post.find(params[:id])
    @markers = [{
      lat: @post.user.latitude,
      lng: @post.user.longitude,
      info_window: @post.user.address,
      image_url: helpers.asset_url("Pin-service.png")
    }]
    @bookings = Booking.where(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:category, :title, :description, :location, :duration, :owner_id, photos: [])
  end
end
