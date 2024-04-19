require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe "#trip" do
  let!(:trip) { create(:trip) }

    it "タイトル、開始日、終了日がある場合、有効である" do
      expect(trip).to be_valid
    end

    it "タイトルがない場合はエラーメッセージを表示" do
      trip.title = nil
      trip.valid?
      expect(trip.errors.full_messages).to include("旅行タイトルを入力してください")
    end

    it "都道府県の選択がない場合はエラーメッセージを表示" do
      trip.prefecture = "---"
      trip.valid?
      expect(trip.errors.full_messages).to include("都道府県を選択してください")
    end

    it "開始日がない場合はエラーメッセージを表示" do
      trip.start_date = nil
      trip.valid?
      expect(trip.errors.full_messages).to include("出発日を入力してください")
    end

    it "終了日がない場合はエラーメッセージを表示" do
      trip.end_date = nil
      trip.valid?
      expect(trip.errors.full_messages).to include("帰宅日を入力してください")
    end

    it "終了日が開始日より前の場合はエラーメッセージを表示" do
      trip.start_date = "2024/2/5"
      trip.end_date = "2024/2/1"
      trip.valid?
      expect(trip.errors.full_messages).to include("帰宅日は出発日より前にしないでください")
    end

    it "開始日と終了日が同日の場合は有効である" do
      trip.start_date = "2024/2/1"
      trip.end_date = "2024/2/1"
      expect(trip).to be_valid
    end
  end
end
