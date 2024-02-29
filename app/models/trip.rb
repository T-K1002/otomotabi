class Trip < ApplicationRecord
  belongs_to :group
  has_many :spots, dependent: :destroy
end
