class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group

  def self.guest_group_user(guest_user, guest_group)
    create!(user_id: guest_user.id) do |group_user|
      group_user.group_id = guest_group.id
    end
  end
end
