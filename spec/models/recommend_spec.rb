require 'rails_helper'

RSpec.describe Recommend, type: :model do
  describe "#recommend" do
  let!(:recommend) { create(:recommend) }

    it "キーワードがある場合、有効である" do
      expect(recommend).to be_valid
    end
  end
end
