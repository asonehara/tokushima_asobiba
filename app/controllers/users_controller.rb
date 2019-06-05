class UsersController < ApplicationController

  def show    #詳細表示（特定のidのユーザを）
    @user = User.find(params[:id])
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
  
  def new
    @user = User.new  　#新規登録画面を表示する
  end
  
  def edit
  end

  def update
  end

  def destroy
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
end