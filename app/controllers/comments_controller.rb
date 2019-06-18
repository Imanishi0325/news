class CommentsController < ApplicationController
  def create
    Comment.create(text: comment_params[:text], top_id: comment_params[:article_id], user_id: current_user.id)
  end
  
  private 
  def comment_params
    params.permit(:text, :article_id)
  end
  
end
