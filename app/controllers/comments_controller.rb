class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], article_id: comment_params[:top_id], user_id: current_user.id)
    redirect_to "/top/#{@comment.article.id}"
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user.id == current_user.id
    redirect_to "/top/#{@comment.article.id}"
  end
  
  private 
  def comment_params
    params.permit(:text, :top_id)
  end
end