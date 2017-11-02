# frozen_string_literal: true

class TagsController < ApplicationController
  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:id])
    @highlights = Highlight.includes(:article).references(:article).active
    @tags = ActsAsTaggableOn::Tag.where('taggings_count > 0')
                                 .where.not('name = ?', params[:id])
                                 .order(taggings_count: :desc)
                                 .includes(:taggings)
                                 .references(:taggings)
                                 .where('taggable_type = ?', 'Article')
    @articles = Article.tagged_with(params[:id])
                       .published
                       .order(published_at: :desc)
                       .paginate(page: params[:page], per_page: 5)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
