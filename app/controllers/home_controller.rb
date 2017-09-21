# frozen_string_literal: true

class HomeController < ApplicationController
  # home
  def index
    @articles = Article.all
    @highlights = Highlight.includes(:article).references(:article).active
  end

  def terms_of_service
  end

  def privacy_policy
  end

  def about_us
  end
end
