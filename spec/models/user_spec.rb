require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#user" do
  let!(:user) { create(:user) }

    it "メールアドレス、パスワードがある場合、有効である" do
      expect(user).to be_valid
    end
  end
end
