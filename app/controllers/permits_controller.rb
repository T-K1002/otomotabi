class PermitsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:create, :destroy, :index]

  def create
    @group = Group.find(params[:group_id])
    permit = current_user.permits.new(group_id: params[:group_id])
    permit.save
    redirect_to request.referer, notice: "グループへ参加申請をしました"
  end

  def destroy
    permit = current_user.permits.find_by(group_id: params[:group_id])
    permit.destroy
    redirect_to request.referer, alert: "グループへの参加申請を取消しました"
  end

  def index
    @permits = Permit.where(group_id: params[:group_id])
  end

  private

  def ensure_correct_user
    @group = Group.find(params[:group_id])
    unless @group.owner_id == current_user.id
      redirect_to group_path(@group), alert: "グループオーナーのみ編集が可能です"
    end
  end
end
