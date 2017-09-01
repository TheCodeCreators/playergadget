# frozen_string_literal: true

class HomeController < ApplicationController
  # home
  def index
    @articles = Article.recent.limit(2)
    @older_articles = Article.older.limit(3)
  end
end
