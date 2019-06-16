class CommentsController < ApplicationController
    before_action :require_user_logged_in

    def create
        spot = Spot.find(params[:spot_id])
        @comment = current_user.comment(spot)
        if @comment.save
            flash[:success] = 'コメント投稿しました'
            redirect_back(fallback_location: root_url)
        else
            flash.now[:danger] = 'コメント投稿できませんでした'
            render "spots/show"
        end
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:content, :star)
    end
end
