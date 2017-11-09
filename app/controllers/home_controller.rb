# frozen_string_literal: true

class HomeController < ApplicationController
  # home
  def index
    # Do not load unecessary data on ajax requests
    if !request.xhr?
      # Refactored and limited to published articles only
      @tags = Article.published.tags_on(:tags).order(taggings_count: :desc)
      @highlights = Highlight.includes(:article).references(:article).active
    end
    @articles = Article.published
                       .order(published_at: :desc)
                       .paginate(page: params[:page], per_page: 7)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def terms_of_service
  end

  def privacy_policy
  end

  def about_us
  end
end
