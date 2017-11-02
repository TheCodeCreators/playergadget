# frozen_string_literal: true

class HomeController < ApplicationController
  # home
  def index
    @articles = Article.published
                       .order(published_at: :desc)
                       .paginate(page: params[:page], per_page: 2)
    @highlights = Highlight.includes(:article).references(:article).active
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
