require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe "#trip" do
  let!(:trip) { create(:trip) }

    it "タイトル、開始日、終了日がある場合、有効である" do
      expect(trip).to be_valid
    end
  end
end
