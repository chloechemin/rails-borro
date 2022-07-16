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

  end

  def no_result
  end
end
