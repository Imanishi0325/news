class UsersController < ApplicationController
  def show
    @articles = Article.where(user_id: current_user.id).page(params[:page]).per(10).order("created_at DESC")
  end
end
