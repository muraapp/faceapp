class GroupsController < ApplicationController
  before_action :authenticate_user!
  # before_action :friends, only: [:index]
  # before_action :myself, only: [:show]

  def index
    @topics = Topic.where(user_id: params[:format]).order(updated_at: :desc)
    @user = User.find(params[:format])
    
  end

  def show
    @topic = Topic.find(params[:id])
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

  private
    #  def friends
    #    @topic = Topic.find(params[:id])
    #    unless current_user.following?(@topic.user) && @topic.user.following?(current_user)
    #      redirect_to groups_path, alert: "このユーザーは友達ではありません。"
    #    end
    #  end

    # def myself
    #   unless @topic.user.id == current_user.id
    #     redirect_to groups_path, alert: "違う"
    #   end
    # end

end
