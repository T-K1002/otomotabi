require 'rails_helper'

RSpec.describe GroupUser, type: :model do
  describe "#group_user" do
  let!(:group_user) { create(:group_user) }

    it "ユーザーID、グループIDがある場合、有効である" do
      expect(group_user).to be_valid
    end
  end
end
