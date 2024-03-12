class Trip < ApplicationRecord
  belongs_to :group
  has_many :spots, dependent: :destroy

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
end
