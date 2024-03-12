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
      expect(trip.errors.full_messages).to include("Title can't be blank")
    end

    it "開始日がない場合はエラーメッセージを表示" do
      trip.start_date = nil
      trip.valid?
      expect(trip.errors.full_messages).to include("Start date can't be blank", "End date comparison of Date with nil failed")
    end

    it "終了日がない場合はエラーメッセージを表示" do
      trip.end_date = nil
      trip.valid?
      expect(trip.errors.full_messages).to include("End date can't be blank")
    end
  end
end
