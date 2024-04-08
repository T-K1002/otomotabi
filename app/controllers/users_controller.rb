class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @groups = Group.includes(:users).where(users: { id: current_user.id })
    @requests = Permit.where(user_id: current_user.id)
    if @user != current_user
      redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end
end
