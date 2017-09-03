# frozen_string_literal: true

class Article < ApplicationRecord
  extend FriendlyId
  belongs_to :user
  acts_as_taggable
  friendly_id :title, use: :slugged

  scope :recent, -> { where('created_at > ?', 1.week.ago.beginning_of_day) }
  scope :older, -> { where('created_at <= ?', 1.week.ago) }
end
