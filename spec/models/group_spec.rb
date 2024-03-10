require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "#group" do
  let!(:group) { create(:group) }

    it "タイトル、紹介文がある場合、有効である" do
      expect(group).to be_valid
    end
  end
end
