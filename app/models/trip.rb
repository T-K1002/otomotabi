class Trip < ApplicationRecord
  belongs_to :group
  has_many :spots, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 15 }
  validates :prefecture, presence: true, exclusion: { in: ["---"], message: "を選択してください" }
  validates :start_date, presence: true
  validates :end_date, presence: true, comparison: { greater_than_or_equal_to: :start_date, message: "は出発日より前にしないでください" }
  validates :image, content_type: { in: %w(image/jpeg image/gif image/png) }, size: { less_than_or_equal_to: 2.megabytes }

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

  def self.guest_trip(guest_group)
    create!(title: "札幌観光") do |trip|
      trip.prefecture = "北海道"
      trip.start_date = "2024/5/4"
      trip.end_date = "2024/5/5"
      trip.group_id = guest_group.id
      trip.image.attach(io: File.open(Rails.root.join('app/assets/images/sapporo.jpg')), filename: 'sapporo.png')
    end
  end
end
