class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    if current_user
      redirect_to groups_path, alert: "すでにログインしています。"
    else
      guest_user = User.guest
      guest_group = Group.guest_group(guest_user)
      GroupUser.guest_group_user(guest_user, guest_group)
      Trip.guest_trip(guest_group)
      guest_trip = Trip.where(group_id: guest_group.id)
      Spot.guest_spot(guest_group, guest_trip)
      sign_in guest_user
      redirect_to groups_path, notice: "ゲストユーザーとしてログインしました。"
    end
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインに成功しました。"
    groups_path
  end
end
