# frozen_string_literal: true

class Image < ApplicationRecord
  acts_as_taggable
  mount_uploader :file, FileUploader

  validates :file, presence: true
end
