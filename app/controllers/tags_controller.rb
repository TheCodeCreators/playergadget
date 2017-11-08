# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :set_tag, only: %i[show]
  before_action :set_hightlights, only: %i[show]

  # rubocop:disable Metrics/AbcSize
  def show
    redirect_to root_path if @tag.nil?
    @tags = Article.published.tags_on(:tags)
                   .where
                   .not('name = ?', params[:id])
                   .order(taggings_count: :desc)
    @articles = Article.tagged_with(@tag.name)
                       .published
                       .order(published_at: :desc)
                       .paginate(page: params[:page], per_page: 5)
    respond_to do |format|
      format.html
      format.js
    end
  end
  # rubocop:enable Metrics/AbcSize

  private

  def set_tag
    @tag = ActsAsTaggableOn::Tag.friendly.find(params[:id])
  end

  def set_hightlights
    @highlights = Highlight.includes(:article).references(:article).active
  end
end
