class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :original_comment,
             class_name:    'Comment',
             foreign_key:   'original_comment_id',
             counter_cache: 'comments_count',
             required:      false
  belongs_to :original_article,
             class_name:    'Article',
             foreign_key:   'original_article_id',
             counter_cache: true,
             required:      false
  has_many :child_comments, class_name: 'Comment', foreign_key: 'original_comment_id'
  has_many :comments, as: :commentable

  before_save :set_originals

  def save_comment_author(current_user)
    self.user = current_user
  end

  private

  def set_originals
    if commentable_type == 'Article'
      self.original_article_id = commentable_id
    else
      self.original_article_id = commentable.original_article_id
      self.original_comment_id = if commentable.original_comment_id.present?
                                   commentable.original_comment_id
                                 else
                                   commentable_id
                                 end
    end
  end
end
