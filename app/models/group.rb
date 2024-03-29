class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  belongs_to :owner, class_name: "User"
  has_many :permits, dependent: :destroy
  has_many :trips, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true
end
