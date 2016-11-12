class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @topics = Topic.all
    @topic = Topic.new
  end

  def new
    @topic = Topic.new
  end

  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

  def create
    @topics = Topic.all
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topics_path, notice: "トピックを作成しました！"
      NoticeMailer.sendmail_topic(@topic).deliver

    else
      render 'index'
    end
  end

  def edit
  end

  def update
    @topic.update(topics_params)
    redirect_to topics_path, notice: "トピックを更新しました！"
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "トピックを削除しました！"
  end

  private
    def topics_params
      params.require(:topic).permit(:content)
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

end
