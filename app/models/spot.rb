class Spot < ApplicationRecord
  belongs_to :trip

  validates :address, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true, comparison: { greater_than: :start_time, message: "は開始時間より後にしてください" }

  geocoded_by :address
  after_validation :geocode

  enum prefecture: {
    "---": 0,
    北海道: 1, 青森県: 2, 岩手県: 3, 宮城県: 4, 秋田県: 5, 山形県: 6, 福島県: 7,
    茨城県: 8, 栃木県: 9, 群馬県: 10, 埼玉県: 11, 千葉県: 12, 東京都: 13, 神奈川県: 14,
    新潟県: 15, 富山県: 16, 石川県: 17, 福井県: 18, 山梨県: 19, 長野県: 20,
    岐阜県: 21, 静岡県: 22, 愛知県: 23, 三重県: 24,
    滋賀県: 25, 京都府: 26, 大阪府: 27, 兵庫県: 28, 奈良県: 29, 和歌山県: 30,
    鳥取県: 31, 島根県: 32, 岡山県: 33, 広島県: 34, 山口県: 35,
    徳島県: 36, 香川県: 37, 愛媛県: 38, 高知県: 39,
    福岡県: 40, 佐賀県: 41, 長崎県: 42, 熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46,
    沖縄県: 47,
  }

  def self.guest_spot(guest_group, guest_trip)
    create!(address: "札幌駅") do |spot|
      spot.prefecture = "北海道"
      spot.date = "2024/4/10"
      spot.memo = "お土産を買う"
      spot.start_time = "10:00"
      spot.end_time = "11:00"
      spot.group_id = guest_group.id
      spot.trip_id = guest_trip.id
    end
    create!(address: "おたる水族館") do |spot|
      spot.prefecture = "北海道"
      spot.date = "2024/4/10"
      spot.memo = "イルカショーを見る！"
      spot.start_time = "13:00"
      spot.end_time = "15:00"
      spot.group_id = guest_group.id
      spot.trip_id = guest_trip.id
    end
  end
end
