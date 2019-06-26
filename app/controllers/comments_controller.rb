class CommentsController < ApplicationController
    before_action :require_user_logged_in

    def create
        @spot = Spot.find(params[:spot_id])
        @comment = Comment.new(comment_params)
        @comment.user= current_user
        @comment.spot = @spot
        if @comment.save
            flash[:success] = 'コメント投稿しました'
            redirect_back(fallback_location: root_url)
        else
            @comments = @spot.comments
            flash.now[:danger] = 'コメント投稿できませんでした'
            render "spots/show"
        end
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:success] = 'コメントを削除しました'
        redirect_back(fallback_location: root_url)
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:content, :star)
    end
end
