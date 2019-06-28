class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @articles = Article.where(user_id: current_user.id).page(params[:page]).per(10).order("created_at DESC")
    @nickname = current_user.nickname
    @user = User.find(params[:id])
    @comments = Comment.where(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user == current_user
      if @user.update(user_params)
        flash[:success] = "ユーザー情報を編集しました。"
        redirect_to :root
      else
        flash.now[:danger] = "ユーザー情報の編集に失敗しました。"
        render :edit
      end
    end
  end
  
  private
  def user_params
    params.permit(:email, :nickname, :password, :image) 
  end
end
