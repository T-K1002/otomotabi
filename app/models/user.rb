class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :permits, dependent: :destroy

  validates :name, presence: { message: "が入力されていません。" }, uniqueness: { message: "は既に使用されています。" },
                   length: { maximum: 15, message: "は15文字以内で入力してください。" }
  validates :avatar, content_type: { in: %w(image/jpeg image/gif image/png) }, size: { less_than_or_equal_to: 2.megabytes }

  def self.guest
    create!(name: "ゲストユーザー" + "(" + SecureRandom.alphanumeric(6) + ")") do |user|
      user.email = SecureRandom.alphanumeric(6) + "@" + SecureRandom.alphanumeric(6) + ".com"
      user.password = SecureRandom.urlsafe_base64
      user.guest = true
    end
  end
end
