class CommentsController < ApplicationController
  before_action :find_commentable, only: %i[create]

  def new
    @comment = current_user.comments.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = 'Comment created.'
      # redirect_to request.referer + "#comment-#{@comment.id}"
      redirect_to request.referer + '#comments'
    else
      flash[:alert] = 'Could not create the comment.'
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.assign_attributes(comment_params)
    if (current_user == @comment.user) || current_user.admin?
      @comment.save
      # redirect_to request.referer + "#comment-#{@comment.id}"
      redirect_to request.referer + '#comments'
    else
      flash.now[:danger] = 'error'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if (current_user == @comment.user) || current_user.admin?
      @comment.destroy
      flash[:notice] = 'Comment successfully deleted.'
    else
      flash.now[:danger] = 'error'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find_by(id: params[:comment_id]) if params[:comment_id]
    @commentable = Article.friendly.find(params[:article_id]) if params[:article_id]
  end
end
