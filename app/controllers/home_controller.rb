# frozen_string_literal: true

class HomeController < ApplicationController
  # home
  def index
    @top_articles = Article.all.first(4)
    @older_articles = Article.all.last(4)
  end
end
