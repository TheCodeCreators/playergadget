# frozen_string_literal: true

class HomeController < ApplicationController
  # home
  def index
    @top_articles = Article.all.first(4)
    @articles = Article.all
  end
end
