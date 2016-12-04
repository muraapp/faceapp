class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:index, :show, :edit, :update, :destroy]

  def index
    @topics = Topic.where(user_id: params[:id]).order(updated_at: :desc)

  end

  def show
    @topic = Topic.find(params[:id])
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

  private

    def correct_user
      @user = User.find(params[:id])
       unless current_user.following?(@user) && @user.following?(current_user)
         redirect_to root_path, alert: "このユーザーは友達ではありません。"
       end
    end

    


end
