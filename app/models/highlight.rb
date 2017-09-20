# frozen_string_literal: true

class Highlight < ApplicationRecord
  belongs_to :article
  # highlights will use article's image, this relation might should be removed
  belongs_to :image, required: false

  scope :active, -> { where(active: true) }

  enum position: %i[top_left top_right line_1 line_2 line_3 line_4]

  # when an highlight is created, callback to check if active, if so,
  # ensure ALL other active from same slot are set to inactive
end
