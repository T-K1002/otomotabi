class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: [:destroy, :update]
  def ensure_normal_user
    if resource.guest == true
      redirect_to groups_path, alert: "ゲストユーザーは更新・削除できません。"
    end
  end

  def after_sign_up_path_for(resource)
    flash[:notice] = "新規登録に成功しました。"
    groups_path
  end

  def after_update_path_for(resource)
    flash[:notice] = "アカウントの編集に成功しました。"
    user_path(resource)
  end
end
