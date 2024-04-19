require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe "#spot" do
  let!(:spot) { create(:spot) }

    it "スポット名、旅行日、開始時間、終了時間、都道府県がある場合、有効である" do
      expect(spot).to be_valid
    end

    it "スポット名がない場合はエラーメッセージを表示" do
      spot.address = nil
      spot.valid?
      expect(spot.errors.full_messages).to include("旅行場所を入力してください")
    end

    it "開始時間がない場合はエラーメッセージを表示" do
      spot.start_time = nil
      spot.valid?
      expect(spot.errors.full_messages).to include("開始時間を入力してください")
    end

    it "終了時間がない場合はエラーメッセージを表示" do
      spot.end_time = nil
      spot.valid?
      expect(spot.errors.full_messages).to include("終了時間を入力してください")
    end

    it "終了時間が開始時間より前の場合はエラーメッセージを表示" do
      spot.start_time = "9:00"
      spot.end_time = "8:00"
      spot.valid?
      expect(spot.errors.full_messages).to include("終了時間は開始時間より後にしてください")
    end
  end
end
