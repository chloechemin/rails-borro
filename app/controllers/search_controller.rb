class SearchController < ApplicationController
  def result
    if params[:category].present? || params[:description].present? || params[:duration].present?

      sql_query = " \
      category LIKE :category \
      AND (title ILIKE :query \
      OR description ILIKE :query) \
      AND duration >= :duration "

      @posts = Post.where(sql_query, category: "%#{params[:category]}%", query: "%#{params[:description]}%", duration: "#{params[:duration]}".to_f)
      # raise
      if @posts.count == 0
         redirect_to search_no_result_path()
      end

    else
      @posts = Post.all
    end
    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        info_window: render_to_string(partial: "info_window", locals: { post: post }),
        image_url: post.category == 'product' ? helpers.asset_url("Pin-thingstoborrow.png") : helpers.asset_url("Pin-service.png")
      }
    end
  end

  def no_result
  end
end
