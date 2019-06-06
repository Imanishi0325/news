class TopController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(10)
  end
  
  def new
  end
  
  def create
    Article.create(text: article_params[:text], user_id: current_user.id)
  end
  
  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id == current_user.id
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(article_params)
    end
  end
  
  private
  def article_params
    params.permit(:text)
  end
end
