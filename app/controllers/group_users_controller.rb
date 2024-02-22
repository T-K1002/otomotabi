class GroupUsersController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @permit = Permit.find(params[:permit_id])
    @group_user = GroupUser.create(user_id: @permit.user_id, group_id: params[:group_id])
    @permit.destroy
    redirect_to request.referer
  end

  def destroy
    @permit = Permit.find(params[:id])
    @permit.destroy
    redirect_to groups_path
  end
end
