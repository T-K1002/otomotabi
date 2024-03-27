class ApplicationController < ActionController::Base
  before_action :get_group_user
  def get_group_user
    @groups = Group.includes(:users).where(users: { id: current_user.id })
  end
end
