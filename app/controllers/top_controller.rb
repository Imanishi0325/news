class TopController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @articles = Article.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.create(text: article_params[:text], user_id: current_user.id)
  if @article.save
    flash[:notice] = "投稿が完了しました。"
    redirect_to :root #成功の場合
  else
    flash[:alert] = "500文字以内で入力してください。"
    render 'new' #失敗の場合 
  end
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
  
  def show
    @article = Article.includes(:user).find(params[:id])
    @comments = @article.comments.includes(:user)
  end
  
  private
  def article_params
    params.permit(:text)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
