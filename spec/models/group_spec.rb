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
      expect(group.errors.added?(:name, :blank)).to be_truthy
    end

    it "紹介文がない場合はエラーメッセージを表示" do
      group.introduction = nil
      group.valid?
      expect(group.errors.added?(:introduction, :blank)).to be_truthy
    end
  end
end
