class FavoritesController < ApplicationController
  
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    @favorite = current_user.favorites.new(topic_id: params[:topic_id])
    if @favorite.save
     redirect_to topics_path, success: 'いいねしました'
   else
     redirect_to topics_path, danger: 'いいね失敗しました'
   end
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    @favorite.destroy
    redirect_to topics_path, success: 'いいねを取り消しました'
  end
end
