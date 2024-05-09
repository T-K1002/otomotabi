require 'rails_helper'

RSpec.describe "Spots", type: :system do
  describe "#spot" do
    let!(:user) { create(:user) }
    let!(:group) { create(:group, owner_id: user.id) }
    let!(:group_user) { create(:group_user, user: user, group: group) }
    let!(:trip) { create(:trip, group_id: group.id) }
    let!(:spot) { create(:spot, group_id: group.id, trip_id: trip.id) }
    let!(:start_date_spot) { create(:spot, group_id: group.id, trip_id: trip.id, date: trip.start_date) }
    let!(:end_date_spot) { create(:spot, group_id: group.id, trip_id: trip.id, date: trip.end_date) }

    before do
      sign_in user
      visit group_trip_spots_path(group, trip)
    end

    it "旅行計画ページが表示されること" do
      expect(page).to have_http_status(200)
    end

    it "出発日に新しい旅行スポットを追加" do
      within "#start_date" do
        expect(page).to have_content trip.start_date
        click_on "スポット追加"
      end
      expect(current_path).to eq new_group_trip_spot_path(group, trip)
      expect(page).to have_content trip.start_date
      fill_in "spot_address", with: spot.address
      fill_in "spot_memo", with: spot.memo
      fill_in "spot_start_time", with: spot.start_time
      fill_in "spot_end_time", with: spot.end_time
      expect { click_on("保存") }
    end

    it "出発日の旅行スポットを編集" do
      within "#start_date" do
        expect(page).to have_content trip.start_date
        click_on "edit"
      end
      expect(current_path).to eq edit_group_trip_spot_path(group, trip, start_date_spot)
      expect(page).to have_content trip.start_date
      expect(find("#spot_address").value).to eq(start_date_spot.address)
      expect(find("#spot_memo").value).to eq(start_date_spot.memo)
      expect(find("#spot_start_time").value).to eq(start_date_spot.start_time.strftime("%T.%L"))
      expect(find("#spot_end_time").value).to eq(start_date_spot.end_time.strftime("%T.%L"))
      fill_in "spot_address", with: "edit_spot_address"
      fill_in "spot_memo", with: "edit_spot_memo"
      fill_in "spot_start_time", with: "10:00"
      fill_in "spot_end_time", with: "11:00"
      expect { click_on("保存") }.to change { Spot.count }.by(0)
      expect(current_path).to eq group_trip_spots_path(group, trip)
      expect(page).to have_content "旅行計画を編集しました。"
    end

    it "出発日の旅行スポットを削除" do
      within "#start_date" do
        expect(page).to have_content trip.start_date
        click_on "delete"
      end
      expect(current_path).to eq group_trip_spot_path(group, trip, start_date_spot)
      expect(page).to have_content "削除しますか？"
      expect { click_on("削除する") }.to change { Spot.count }.by(-1)
      expect(current_path).to eq group_trip_spots_path(group, trip)
      expect(page).to have_content "旅行計画を削除しました。"
    end

    it "中間日に新しい旅行スポットを追加" do
      within "#middle_date" do
        expect(page).to have_content spot.date
        click_on "スポット追加", match: :first
      end
      expect(current_path).to eq new_group_trip_spot_path(group, trip)
      fill_in "spot_address", with: spot.address
      fill_in "spot_memo", with: spot.memo
      fill_in "spot_start_time", with: spot.start_time
      fill_in "spot_end_time", with: spot.end_time
      expect { click_on("保存") }
    end

    it "中間日の旅行スポットを編集" do
      within "#middle_date" do
        expect(page).to have_content spot.date
        click_on "edit", match: :first
      end
      expect(current_path).to eq edit_group_trip_spot_path(group, trip, spot)
      expect(page).to have_content spot.date
      expect(find("#spot_address").value).to eq(spot.address)
      expect(find("#spot_memo").value).to eq(spot.memo)
      expect(find("#spot_start_time").value).to eq(spot.start_time.strftime("%T.%L"))
      expect(find("#spot_end_time").value).to eq(spot.end_time.strftime("%T.%L"))
      fill_in "spot_address", with: "edit_spot_address"
      fill_in "spot_memo", with: "edit_spot_memo"
      fill_in "spot_start_time", with: "10:00"
      fill_in "spot_end_time", with: "11:00"
      expect { click_on("保存") }.to change { Spot.count }.by(0)
      expect(current_path).to eq group_trip_spots_path(group, trip)
      expect(page).to have_content "旅行計画を編集しました。"
    end

    it "中間日の旅行スポットを削除" do
      within "#middle_date" do
        expect(page).to have_content spot.date
        click_on "delete"
      end
      expect(current_path).to eq group_trip_spot_path(group, trip, spot)
      expect(page).to have_content "削除しますか？"
      expect { click_on("削除する") }.to change { Spot.count }.by(-1)
      expect(current_path).to eq group_trip_spots_path(group, trip)
      expect(page).to have_content "旅行計画を削除しました。"
    end

    it "帰宅日に新しい旅行スポットを追加" do
      within "#end_date" do
        expect(page).to have_content trip.end_date
        click_on "スポット追加"
      end
      expect(current_path).to eq new_group_trip_spot_path(group, trip)
      expect(page).to have_content trip.end_date
      fill_in "spot_address", with: spot.address
      fill_in "spot_memo", with: spot.memo
      fill_in "spot_start_time", with: spot.start_time
      fill_in "spot_end_time", with: spot.end_time
      expect { click_on("保存") }
    end

    it "帰宅日の旅行スポットを編集" do
      within "#end_date" do
        expect(page).to have_content trip.end_date
        click_on "edit", match: :first
      end
      expect(current_path).to eq edit_group_trip_spot_path(group, trip, end_date_spot)
      expect(page).to have_content trip.end_date
      expect(find("#spot_address").value).to eq(end_date_spot.address)
      expect(find("#spot_memo").value).to eq(end_date_spot.memo)
      expect(find("#spot_start_time").value).to eq(end_date_spot.start_time.strftime("%T.%L"))
      expect(find("#spot_end_time").value).to eq(end_date_spot.end_time.strftime("%T.%L"))
      fill_in "spot_address", with: "edit_spot_address"
      fill_in "spot_memo", with: "edit_spot_memo"
      fill_in "spot_start_time", with: "10:00"
      fill_in "spot_end_time", with: "11:00"
      expect { click_on("保存") }.to change { Spot.count }.by(0)
      expect(current_path).to eq group_trip_spots_path(group, trip)
      expect(page).to have_content "旅行計画を編集しました。"
    end

    it "帰宅日の旅行スポットを削除" do
      within "#end_date" do
        expect(page).to have_content end_date_spot.date
        click_on "delete"
      end
      expect(current_path).to eq group_trip_spot_path(group, trip, end_date_spot)
      expect(page).to have_content "削除しますか？"
      expect { click_on("削除する") }.to change { Spot.count }.by(-1)
      expect(current_path).to eq group_trip_spots_path(group, trip)
      expect(page).to have_content "旅行計画を削除しました。"
    end
  end
end
