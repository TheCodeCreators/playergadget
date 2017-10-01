# frozen_string_literal: true

class ArticlesController < ApplicationController
  def show
    @article = Article.friendly.find(params[:id])
    # Only admins can see unpublished articles
    redirect_to root_path unless @article.published? || current_user.try(:admin?)
    @comments = @article.comments.order(created_at: :asc)
    # Returns all recent published articles minus the main @article.
    @side_articles = Article.published
                            .recent
                            .where
                            .not(id: @article.id)
                            .order(published_at: :desc)
                            .limit(5)
  end
end
