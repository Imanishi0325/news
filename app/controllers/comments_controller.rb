class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], article_id: comment_params[:top_id], user_id: current_user.id)
    @article = Article.find(params[:top_id])
    @comments = @article.comments.includes(:user)
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @article = @comment.article
    @comments = Comment.all
    @comment.destroy if @comment.user.id == current_user.id
  end
  
  private 
  def comment_params
    params.permit(:text, :top_id)
  end
end