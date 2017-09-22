# frozen_string_literal: true

class Article < ApplicationRecord
  extend FriendlyId
  belongs_to :user
  acts_as_taggable
  friendly_id :title, use: :slugged
  mount_uploader :image, ArticleImageUploader

  before_destroy :remove__all_image_versions

  scope :published, -> { where('published_at is not null AND published_at <= ?', Time.zone.now) }
  scope :recent, -> { where('created_at > ?', 1.week.ago.beginning_of_day) }
  scope :older, -> { where('created_at <= ?', 1.week.ago) }

  def published?
    published_at.nil? ? false : (published_at <= Time.zone.now)
  end

  private

  # Keep in mind images uploaded to the Image model will not be deleted,
  # only the image associated with the article itself will (and all it's versions)
  def remove__all_image_versions
    FileUtils.rm_r(Rails.root.join('public', "/uploads/article/image/#{id}"), force: true)
  end
end
