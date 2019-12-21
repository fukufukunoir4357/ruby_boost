class TopicsController < ApplicationController
  
  
  def index
    @topics = Topic.all
  end
  
  def new
    @topic = Topic.find_by(params[:id])
  end
  
  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    
    if @topic.save
      redirect_to topics_path
      flash.now[:success]= '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  
  
   private
    def topic_params
      params.require(:topic).permit(:image, :description)
    end
    
end

