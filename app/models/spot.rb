class Spot < ApplicationRecord
  belongs_to :trip

  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, comparison: { greater_than: :start_time }
end
