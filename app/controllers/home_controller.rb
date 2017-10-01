# frozen_string_literal: true

class HomeController < ApplicationController
  # home
  def index
    @articles = Article.published.order(published_at: :desc)
    @highlights = Highlight.includes(:article).references(:article).active
  end

  def terms_of_service
  end

  def privacy_policy
  end

  def about_us
  end
end
