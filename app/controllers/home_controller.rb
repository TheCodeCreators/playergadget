# frozen_string_literal: true

class HomeController < ApplicationController
  # home
  def index
    @articles = Article.published
                       .order(published_at: :desc)
                       .paginate(page: params[:page], per_page: 7)
    @highlights = Highlight.includes(:article).references(:article).active
    @tags = ActsAsTaggableOn::Tag.where('taggings_count > 0').order(taggings_count: :desc)
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
