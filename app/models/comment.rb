class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, counter_cache: true, polymorphic: true
  has_many :comments, as: :commentable

  def save_comment_author(current_user)
    self.user = current_user
  end

end
