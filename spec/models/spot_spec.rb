require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe "#spot" do
  let!(:spot) { create(:spot) }

    it "スポット名、旅行日、開始時間、終了時間がある場合、有効である" do
      expect(spot).to be_valid
    end
  end
end
