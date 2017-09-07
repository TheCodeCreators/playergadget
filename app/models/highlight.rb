# frozen_string_literal: true

class Highlight < ApplicationRecord
  belongs_to :article
  belongs_to :image
end
