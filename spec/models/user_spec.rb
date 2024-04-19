require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#user" do
  let!(:user) { create(:user) }

    it "名前、メールアドレス、パスワードがある場合、有効である" do
      expect(user).to be_valid
    end

    it "名前がない場合はエラーメッセージを表示" do
      user.name = nil
      user.valid?
      expect(user.errors.full_messages).to include("名前が入力されていません。")
    end

    it "同じ名前を登録できないこと" do
      user1 = FactoryBot.create(:user)
      user.name = user1.name
      user.valid?
      expect(user.errors.full_messages).to include("名前は既に使用されています。")
    end
    
    it "メールアドレスがない場合はエラーメッセージを表示" do
      user.email = nil
      user.valid?
      expect(user.errors.full_messages).to include("メールアドレスが入力されていません。")
    end

    it "同じメールアドレスを登録できないこと" do
      user1 = FactoryBot.create(:user)
      user.email = user1.email
      user.valid?
      expect(user.errors.full_messages).to include("メールアドレスは既に使用されています。")
    end

    it "@のないメールアドレスを登録できないこと" do
      user.email = Faker::Lorem.characters(number: 10, min_alpha: 10) 
      user.valid?
      expect(user.errors.full_messages).to include("メールアドレスは有効でありません。")
    end

    it "パスワードがない場合はエラーメッセージを表示" do
      user.password = nil
      user.valid?
      expect(user.errors.full_messages).to include("パスワードが入力されていません。")
    end

    it "パスワードが文字数5文字では登録できないこと" do
      user.password = Faker::Lorem.characters(number: 5)
      user.valid?
      expect(user.errors.full_messages).to include("パスワードは6文字以上に設定して下さい。")
    end

    it "パスワードと確認パスワードが一致しないと登録できないこと" do
      user.password = Faker::Lorem.characters(number: 7) 
      user.password_confirmation =  Faker::Lorem.characters(number: 6) 
      user.valid?
      expect(user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
    end
  end
end
