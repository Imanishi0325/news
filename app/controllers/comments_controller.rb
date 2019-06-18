class CommentsController < ApplicationController
  def create
    Comment.create(text: params[:text], top_id: params[:article_id], user_id: current_user.id)
  end
end
