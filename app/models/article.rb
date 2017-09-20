# frozen_string_literal: true

class Article < ApplicationRecord
  extend FriendlyId
  belongs_to :user
  acts_as_taggable
  friendly_id :title, use: :slugged
  mount_uploader :image, ArticleImageUploader

  scope :recent, -> { where('created_at > ?', 1.week.ago.beginning_of_day) }
  scope :older, -> { where('created_at <= ?', 1.week.ago) }

  def published?
    self.published_at.nil? ? false : !(self.published_at > Time.zone.now)
  end
end
