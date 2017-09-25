class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = current_user.comments.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user.id

    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Article.friendly.find(params[:article_id]) if params[:article_id]
  end

end
