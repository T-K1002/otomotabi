class ApplicationController < ActionController::Base
  before_action :get_group_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  def get_group_user
    if user_signed_in?
      @user = User.find(current_user.id)
      @groups = Group.includes(:users).where(users: { id: current_user.id })
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
end
