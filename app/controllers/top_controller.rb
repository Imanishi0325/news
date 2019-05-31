class TopController < ApplicationController
  def index
    @articles = Article.all 
  end
  
  def new
  end
  
  def create
    Article.create(text: article_params[:text], user_id: current_user.id)
  end
  
  private
  def article_params
    params.permit(:text)
  end
end
