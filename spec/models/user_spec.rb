require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#user" do
  let!(:user) { create(:user) }

    it "メールアドレス、パスワードがある場合、有効である" do
      expect(user).to be_valid
    end
    
    it "メールアドレスがない場合はエラーメッセージを表示" do
      user.email = nil
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
