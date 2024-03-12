require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe "#spot" do
  let!(:spot) { create(:spot) }

    it "スポット名、旅行日、開始時間、終了時間がある場合、有効である" do
      expect(spot).to be_valid
    end

    it "スポット名がない場合はエラーメッセージを表示" do
      spot.name = nil
      spot.valid?
      expect(spot.errors.full_messages).to include("Name can't be blank")
    end

    it "旅行日がない場合はエラーメッセージを表示" do
      spot.date = nil
      spot.valid?
      expect(spot.errors.full_messages).to include("Date can't be blank")
    end

    it "開始時間がない場合はエラーメッセージを表示" do
      spot.start_time = nil
      spot.valid?
      expect(spot.errors.full_messages).to include("Start time can't be blank")
    end

    it "終了時間がない場合はエラーメッセージを表示" do
      spot.end_time = nil
      spot.valid?
      expect(spot.errors.full_messages).to include("End time can't be blank")
    end


  end
end
