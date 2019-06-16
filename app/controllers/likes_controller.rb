class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    spot = Spot.find(params[:spot_id])
    current_user.like(spot)
    flash[:success] = 'お気に入りしました'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    spot = Spot.find(params[:spot_id])
    current_user.unlike(spot)
    flash[:success] = 'お気に入りを解除しました'
    redirect_back(fallback_location: root_url)
  end
end
