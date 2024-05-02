require 'rails_helper'

RSpec.describe "Trips", type: :system do
  describe "#trip" do
    let!(:user){ create(:user)}
    let!(:group){ create(:group, owner_id: user.id)}
    let!(:group_user){ create(:group_user, user: user, group: group)}
    let!(:trip){ create(:trip, group_id: group.id)}


    before do
      sign_in user
      visit group_trips_path(group)
    end

    it "旅行一覧ページが表示されること" do
      expect(page).to have_http_status(200)
    end

    it "旅行一覧ページにタイトル、グループ名、旅行計画へのリンクが表示される" do
      expect(page).to have_content "Travel List"
      expect(page).to have_content group.name
      expect(page).to have_content "新しく旅行計画を立てる"
    end

    it "旅行ページへ遷移できる" do
      expect(page).to have_content "新しく旅行計画を立てる"
      click_on "新しく旅行計画を立てる"
      expect(current_path).to eq new_group_trip_path(group)
    end

    it "都道府県ごとのページに旅行計画が表示される" do
      visit "/groups/#{group.id}/prefectures/1"
      expect(page).to have_content(trip.title)
      expect(page).to have_content(trip.prefecture)
    end

    it "新しい旅行計画を作成できる" do
      visit "/groups/#{group.id}/prefectures/1"
      click_on "新しく旅行計画を立てる"
      expect(current_path).to eq new_group_trip_path(group)
      fill_in "trip_title", with: trip.title
      find("#trip_prefecture").find("option[value='北海道']").select_option
      fill_in "trip_start_date", with: trip.start_date
      fill_in "trip_end_date", with: trip.end_date
      expect { click_on("保存")}.to change { Trip.count }.by(1)
      expect(current_path).to eq group_trip_spots_path(group, group.trips.last)
      expect(page).to have_content "新しい旅行計画を作成しました。"
    end

    it "旅行計画を立てることができる" do
      visit "/groups/#{group.id}/prefectures/1"
      click_on "計画ページへ"
      expect(current_path).to eq group_trip_spots_path(group,trip)
    end

    it "旅行計画を編集できる" do
      visit "/groups/#{group.id}/prefectures/1"
      click_on "edit"
      expect(current_path).to eq edit_group_trip_path(group, trip)
      expect(find("#trip_title").value).to eq(trip.title)
      expect(find("#trip_prefecture").value).to eq(trip.prefecture)
      expect(find("#trip_start_date").value).to eq(trip.start_date.strftime("%Y-%m-%d"))
      expect(find("#trip_end_date").value).to eq(trip.end_date.strftime("%Y-%m-%d"))
      fill_in "trip_title", with: "edit_title"
      find("#trip_prefecture").find("option[value='北海道']").select_option
      fill_in "trip_start_date", with: "2024/5/1"
      fill_in "trip_end_date", with: "2024/5/2"
      expect { click_on("保存")}.to change { Trip.count }.by(0)
      expect(current_path).to eq "/groups/#{group.id}/prefectures/1"
      expect(page).to have_content "旅行計画を編集しました。"
    end

    it "旅行計画を削除できる" do
      visit "/groups/#{group.id}/prefectures/1"
      click_on "delete"
      expect(current_path).to eq group_trip_path(group, trip)
      expect(page).to have_content "削除しますか？"
      expect { click_on("削除する")}.to change { Trip.count }.by(-1)
      expect(current_path).to eq "/groups/#{group.id}/prefectures/1"
      expect(page).to have_content "旅行計画を削除しました。"
    end
  end
end
