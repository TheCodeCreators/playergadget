# frozen_string_literal: true

class HomeController < ApplicationController
  # home
  def index
    @articles = Article.published
                       .order(published_at: :desc)
                       .paginate(page: params[:page], per_page: 7)
    @highlights = Highlight.includes(:article).references(:article).active
    # Refactored and limited to published articles only
    @tags = Article.published.tags_on(:tags)
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
