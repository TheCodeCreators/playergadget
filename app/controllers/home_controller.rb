# frozen_string_literal: true

class HomeController < ApplicationController
  # home
  def index
    @top_articles = Article.all.first(2)
    @top_left_article = Article.first
    @top_right_article = Article.second
    @articles = Article.all
    @mini_articles = Article.all.last(4)
  end
end
