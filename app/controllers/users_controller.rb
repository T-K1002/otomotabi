class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end
end
