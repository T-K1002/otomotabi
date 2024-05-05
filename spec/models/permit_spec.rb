require 'rails_helper'

RSpec.describe Permit, type: :model do
  describe "#permit" do
    let!(:permit) { create(:permit) }

    it "ユーザーID、グループIDがある場合、有効である" do
      expect(permit).to be_valid
    end
  end
end
