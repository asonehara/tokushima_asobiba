class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update, :destroy]

  def show    #詳細表示（特定のidのユーザを）
    @user = User.find(params[:id])
     
    @liked_spots = @user.liked_spots.page(params[:page]) #お気に入り一覧
    counts(@user)      #お気に入りスポットの数をカウント
  end

  def new    #新規登録画面を表示する
    @user = User.new
  end
  
  def create       #登録処理を行う
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ登録できませんでした。'
      render :new
    end
  end
  
  def edit     #編集画面を表示する
    @user = User.find(params[:id])
  end

  def update　#更新処理を行う
    @user = User.update(user_params)
    
    if @user.save
      flash[:success] ='編集しました'
      redirect_to @user
    else
      flash.now[:danger] = '編集できませんでした'
      render :edit
    end
  end

  def destroy　　#削除処理を行う (いるのかな？)中途半端に書いたけど
    @user = User.find(params[:id])
    @user.destroy
  end
  
  def spots
    redirect_to "http://www.yahoo.co.jp/"
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
  
end

