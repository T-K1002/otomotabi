require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "#group" do
  let!(:group) { create(:group) }

    it "グループ名、紹介文がある場合、有効である" do
      expect(group).to be_valid
    end

    it "グループ名がない場合はエラーメッセージを表示" do
      group.name = nil
      group.valid?
      expect(group.errors.full_messages).to include("グループ名を入力してください")
    end

    it "同じ名前を登録できないこと" do
      group1 = FactoryBot.create(:group)
      group.name = group1.name
      group.valid?
      expect(group.errors.full_messages).to include("グループ名はすでに存在します")
    end

    it "紹介文がない場合はエラーメッセージを表示" do
      group.introduction = nil
      group.valid?
      expect(group.errors.full_messages).to include("紹介文を入力してください")
    end
  end
end
