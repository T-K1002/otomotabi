require 'rails_helper'

RSpec.describe "Recommends", type: :system do
  describe "#recommend" do
    let!(:user){ create(:user)}
    let!(:group){ create(:group, owner_id: user.id)}
    let!(:group_user){ create(:group_user, user: user, group: group)}
    let!(:recommend){ create(:recommend)}
   
    
    before do
      sign_in user
      visit "/groups/#{group.id}/prefectures/1"
    end

    it "openaiでおすすめの旅行先を検索できる" do
      fill_in "recommend_genre", with: recommend.genre
      expect { click_on("作成")}.to change { Recommend.count }.by(1)
      visit recommend_path(recommend)
      expect(page).to have_content "おすすめの旅行先"
    end
  end
end
