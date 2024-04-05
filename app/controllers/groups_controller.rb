class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.includes(:users).where(users: { id: current_user.id })
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.users << current_user
    if @group.save
      # redirect_to group_trips_path(@group), notice: "新しいグループを作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @group = Group.find(params[:id])
    if @group.owner_id != current_user.id
      redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def exit
    @group = Group.find(params[:group_id])
    @group.users.delete(current_user)
    redirect_to groups_path
  end

  def search
    @group = Group.find_by('name LIKE ?', "#{params[:name]}")
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction)
  end
end
