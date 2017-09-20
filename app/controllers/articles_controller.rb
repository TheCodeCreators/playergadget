# frozen_string_literal: true

class ArticlesController < ApplicationController
  def show
    @article = Article.friendly.find(params[:id])
    # Only admins can see unpublished articles
    redirect_to root_path unless @article.published? || current_user.admin?
  end
end
