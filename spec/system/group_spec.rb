require 'rails_helper'

RSpec.describe "Groups", type: :system do
  describe "#group" do
    let!(:user) { create(:user) }
    let!(:group) { create(:group, owner_id: user.id) }
    let!(:group_user) { create(:group_user, user: user, group: group) }
    let!(:onother_user) { create(:user) }
    let!(:onother_group_user) { create(:group_user, user: onother_user, group: group) }

    before do
      sign_in user
      visit groups_path
    end

    it "グループ一覧ページが表示されること" do
      expect(page).to have_http_status(200)
    end

    it "グループ一覧に所属グループ名、紹介、メンバーの名前、旅行ページへのリンクボタンが表示されること" do
      expect(page).to have_content(group.name)
      expect(page).to have_content(group.introduction)
      group.users.each do |member|
        expect(page).to have_content(member.name)
      end
      expect(page).to have_content "旅行一覧ページへ"
    end

    it "グループの編集ができる" do
      click_on "edit"
      expect(current_path).to eq edit_group_path(group)
      expect(find("#group_name").value).to eq(group.name)
      expect(find("#group_introduction").value).to eq(group.introduction)
      fill_in "group_name", with: "name"
      fill_in "group_introduction", with: "introduction"
      expect { click_on("保存") }.to change { Group.count }.by(0)
      expect(current_path).to eq groups_path
      expect(page).to have_content "グループを編集しました。"
    end

    it "旅行ページへ遷移する" do
      click_on "旅行一覧ページへ"
      expect(current_path).to eq group_trips_path(group)
    end

    it "新しいグループを作成できる" do
      click_on "グループを作成する"
      expect(current_path).to eq new_group_path
      group = FactoryBot.build(:group)
      fill_in "group_name", with: group.name
      fill_in "group_introduction", with: group.introduction
      expect { click_on("保存") }.to change { Group.count }.by(1)
      expect(current_path).to eq groups_path
      expect(page).to have_content "新しいグループを作成しました。"
    end

    it "未参加のグループに参加申請ができる" do
      created_group = FactoryBot.create(:group)
      fill_in "name", with: created_group.name
      click_on "参加する"
      expect(current_path).to eq search_path
      expect(page).to have_content "#{created_group.name}に参加します"
      expect { click_on("加入申請") }.to change { Permit.count }.by(1)
      expect(current_path).to eq groups_path
    end

    it "未作成のグループには参加申請ができない" do
      created_group = FactoryBot.build(:group)
      fill_in "name", with: created_group.name
      click_on "参加する"
      expect(current_path).to eq search_path
      expect(page).to have_content "グループが存在しません"
    end

    it "加入済みのグループには参加申請ができない" do
      fill_in "name", with: group.name
      click_on "参加する"
      expect(current_path).to eq search_path
      expect(page).to have_content "加入済みです"
    end
  end
end
