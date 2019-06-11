class SpotsController < ApplicationController
  before_action :require_admin_user, only: [:new, :create, :edit, :update, :destroy]
    
    def new
        @spot = Spot.new
        @category = Category.find(params[:category_id])
    end
    
    def create
        @category = Category.find(params[:category_id])
        @spot = @category.spots.build(spot_params)
        
        if @spot.save
            flash[:success] = '投稿できました'
            redirect_to @spot     #その詳細ページに飛ぶ方がいいかも
        end
    end
    
    def show
        @spot = Spot.find(params[:id])
    end
    
    def edit   #編集画面表示
       @spot = Spot.find(params[:id])
    end
    
    def update  #更新処理を行う
        @spot = Spot.find(params[:id])
        
        if @spot.update(spot_params)
            flash[:success] = '投稿を編集しました'
            redirect_to @spot
        else
            flash.now[:danger] = '編集できませんでした'
            render :edit
        end
    end
    
    def destroy
        @spot = Spot.find(params[:id])
        @spot.destroy
        
        flash[:success] = '投稿を削除しました'
        redirect_to root_url
    end
    
    private
    
    def spot_params
        params.require(:spot).permit(:name, :description, :image1, :image2, :image3)
    end
    
    
end
