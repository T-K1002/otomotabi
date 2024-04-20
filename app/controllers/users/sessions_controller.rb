class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    guest_user = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.name = "guest"
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in guest_user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end
end
