module CommentsHelper
  # Returns comment's created_at date formatted.
  def comment_date(comment)
    if comment.created_at > Time.zone.now - 1.day
      comment.created_at.strftime('%H:%M')
    else
      comment.created_at.strftime('%d %B %Y at %H:%M')
    end
  end
end
