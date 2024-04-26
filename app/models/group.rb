class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  belongs_to :owner, class_name: "User"
  has_many :permits, dependent: :destroy
  has_many :trips, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true

  def self.guest_group(guest_user)
    create!(name: "ゲストグループ" + "(" + SecureRandom.alphanumeric(6) + ")") do |group|
      group.introduction = "北海道に行きたい！"
      group.owner_id = guest_user.id
    end
  end
end
