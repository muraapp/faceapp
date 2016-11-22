class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @topics = Topic.where(user_id: params[:format]).order(updated_at: :desc)
    @user = User.find(params[:format])
  end

  def show
    @topic = Topic.find(params[:id])

    unless current_user.following?(@topic.user)
      redirect_to logout_path, alert: "この操作はできません。"
    end

    @comment = @topic.comments.build
    @comments = @topic.comments
  end
end
