class UsersController < ApplicationController
  def index
    @users = User.all
  end

  # 友達(相互フォロー)
  def groups
    @user = current_user
    @users = User.all
  end
end
