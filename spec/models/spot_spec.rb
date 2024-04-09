=begin %>
require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe "#spot" do
  let!(:spot) { create(:spot) }

    it "スポット名、旅行日、開始時間、終了時間、都道府県がある場合、有効である" do
      expect(spot).to be_valid
    end

    it "スポット名がない場合はエラーメッセージを表示" do
      spot.name = nil
      spot.valid?
      expect(spot.errors.added?(:name, :blank)).to be_truthy
    end

    it "旅行日がない場合はエラーメッセージを表示" do
      spot.date = nil
      spot.valid?
      expect(spot.errors.added?(:date, :blank)).to be_truthy
    end

    it "開始時間がない場合はエラーメッセージを表示" do
      spot.start_time = nil
      spot.valid?
      expect(spot.errors.added?(:start_time, :blank)).to be_truthy
    end

    #it "終了時間がない場合はエラーメッセージを表示" do
      #spot.end_time = nil
      #spot.valid?
      #expect(spot.errors.added?(:end_time, :blank)).to be_truthy
    #end
  end
end
=end %>
