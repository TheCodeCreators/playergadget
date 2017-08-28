# frozen_string_literal: true

class Article < ApplicationRecord
  extend FriendlyId
  belongs_to :user
  acts_as_taggable
  friendly_id :title, use: :slugged
end
