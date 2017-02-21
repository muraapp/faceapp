
require 'rails_helper'
RSpec.describe MessagesController do
  # describe 'GET#index' do
  #
  #   # ユーザーのログイン
  #   context 'ログインしている場合' do
  #     include_context 'login_as_user'
  #     user_b = User.create(:user)
  #     user_c = User.create(:user)
  #     @user.follow!(user_b)
  #     user_b.follow!(user_c)
  #
  #   end
  #
  #   context 'ログインしていない場合' do
  #
  #   end
  # end



  feature "メッセージの閲覧機能について Show messages function" do
    scenario "友達じゃない人のメッセージを見る場合(却下される)" do
      user = create(:user, uid: 34)
      user.confirmed_at = Time.now
      user.save
      login_as(user, :scope => :user)
      user_b = create(:user, uid: 345)
      user_b.confirmed_at = Time.now
      user_b.save
      user_c = create(:user, uid:435)
      user_b.follow!(user_c)
      user_c.follow!(user_b)
       con = Conversation.create!(sender_id: user_b.id, recipient_id: user_c.id)
      visit conversation_messages_path(con)
      expect(page).to have_content '友達ではないのでメッセージは見れません。'
    end

    scenario "友達のメッセージを見る場合" do
      user = create(:user, uid: 56)
      user.confirmed_at = Time.now
      user.save
      login_as(user, :scope => :user)
      user_b = create(:user, uid: 567)
      user_b.confirmed_at = Time.now
      user_b.save
      user.follow!(user_b)
      user_b.follow!(user)

      con2 = Conversation.create!(sender_id: user.id, recipient_id: user_b.id)
      visit conversation_messages_path(con2)
      expect(page).not_to have_content '友達ではないのでメッセージは見れません。'
    end

  end
end
