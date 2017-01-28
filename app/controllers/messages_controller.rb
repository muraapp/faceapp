class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  # before_action :correct_user, only: [:index, :show, :edit, :update, :destroy]


  def index
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    if @messages.last
      if @messages.last.user_id != current_user.id
       @messages.last.read = true
      end
    end

    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      redirect_to conversation_messages_path(@conversation), notice: "入力されていません"
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end

    # def correct_user
    #     @conversation = Conversation.find(params[:conversation_id])
    #       if current_user.id != @conversation.sender_id || current_user.id == @conversation.recipient_id
    #         redirect_to root_path, alert: "メッセージ見れません。"
    #       end
    # end

end
