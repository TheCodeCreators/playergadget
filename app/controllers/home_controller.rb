# frozen_string_literal: true

class HomeController < ApplicationController
  # home
  def index
    @articles = Article.all
    @highlights = Highlight.includes(:article).references(:article).active
  end
end
