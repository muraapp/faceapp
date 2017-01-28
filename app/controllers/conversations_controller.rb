class ConversationsController < ApplicationController
  before_action :authenticate_user!
  #  before_action :correct_user, only: [:index, :show, :edit, :update, :destroy]


  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

    # def correct_user
    #      @user = User.find(params[:conversation_id])
    #       unless current_user == @user
    #         redirect_to root_path, alert: "メッセージ見れません。"
    #       end
    #   end

    #  def correct_user
    #    @user = User.find(params[:conversation_id])
    #     unless current_user.following?(@user) && @user.following?(current_user)
    #       redirect_to root_path, alert: "このユーザーは友達ではないのでメッセージを見れません。"
    #     end
    #  end



end
