class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :permits, dependent: :destroy

  validates :avatar, content_type: { in: %w(image/jpeg image/gif image/png) }, size: { less_than_or_equal_to: 2.megabytes }
end
