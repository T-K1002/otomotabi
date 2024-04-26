require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe "#user" do
  let!(:user) { build(:user) }

    it "新規登録した後、グループページへ遷移する" do
        visit new_user_registration_path
        fill_in "名前", with: user.name
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: user.password
        fill_in "確認用パスワード", with: user.password_confirmation
        expect { click_on("登録する")}.to change { User.count }.by(1)
        expect(current_path).to eq groups_path
        expect(page).to have_content "新規登録に成功しました。"
    end

    it "名前が未入力の場合、同じページへ遷移する" do
        visit new_user_registration_path
        fill_in "名前", with: nil
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: user.password
        fill_in "確認用パスワード", with: user.password_confirmation
        click_on "登録する"
        expect(current_path).to eq users_path
        expect(page).to have_content "名前が入力されていません。"
    end

    it "メールアドレスが未入力の場合、同じページへ遷移する" do
        visit new_user_registration_path
        fill_in "名前", with: user.name
        fill_in "メールアドレス", with: nil
        fill_in "パスワード", with: user.password
        fill_in "確認用パスワード", with: user.password_confirmation
        click_on "登録する"
        expect(current_path).to eq users_path
        expect(page).to have_content "メールアドレスが入力されていません。"
    end

    it "パスワードが未入力の場合、同じページへ遷移する" do
        visit new_user_registration_path
        fill_in "名前", with: user.name
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: nil
        fill_in "確認用パスワード", with: user.password_confirmation
        click_on "登録する"
        expect(current_path).to eq users_path
        expect(page).to have_content "パスワードが入力されていません。"
    end

    it "パスワードと確認用パスワードが一致しない場合、同じページへ遷移する" do
        visit new_user_registration_path
        fill_in "名前", with: user.name
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: "123456"
        fill_in "確認用パスワード", with: "abcdef"
        click_on "登録する"
        expect(current_path).to eq users_path
        expect(page).to have_content "確認用パスワードとパスワードの入力が一致しません"
    end

    it "パスワードが５文字以下の時、同じページへ遷移する" do
        visit new_user_registration_path
        fill_in "名前", with: user.name
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: "12345"
        fill_in "確認用パスワード", with: "12345"
        click_on "登録する"
        expect(current_path).to eq users_path
        expect(page).to have_content "パスワードは6文字以上に設定して下さい。"
    end

    it "ログインした後、グループページへ遷移する" do
        visit new_user_session_path
        sign_in create(:user)
        find("#login").click
        expect(current_path).to eq groups_path
        expect(page).to have_content "ログインに成功しました。"
    end

    it "マイページにユーザーの名前・メールアドレス、所属グループ名が表示される" do
        sample_user = FactoryBot.create(:user)
        group = FactoryBot.create(:group)
        group_user = FactoryBot.create(:group_user, user: sample_user, group: group)
        sign_in sample_user
        visit user_path(sample_user)
        expect(page).to have_content sample_user.name
        expect(page).to have_content sample_user.email
        expect(page).to have_content "編集"
        expect(page).to have_content group.name
    end

    it "参加申請中のグループが存在しているときは、そのグループ名がマイページに表示される" do
        sample_user = FactoryBot.create(:user)
        group = FactoryBot.create(:group)
        group_user = FactoryBot.create(:permit, user: sample_user, group: group)
        sign_in sample_user
        visit user_path(sample_user)
        expect(page).to have_content sample_user.name
        expect(page).to have_content sample_user.email
        expect(page).to have_content "編集"
        expect(page).to have_content group.name
    end

    it "編集ページから編集ができる" do
        sample_user = FactoryBot.create(:user)
        edit_user = FactoryBot.build(:user)
        sign_in sample_user
        visit user_path(sample_user)
        click_on "編集"
        expect(current_path).to eq edit_user_registration_path(sample_user)
        expect(find("#user_name").value).to eq(sample_user.name)
        expect(find("#user_email").value).to eq(sample_user.email)
        fill_in "名前", with: edit_user.name
        fill_in "メールアドレス", with: edit_user.email
        fill_in "現在のパスワード", with: sample_user.password
        fill_in "user_password", with: edit_user.password
        fill_in "user_password_confirmation", with: edit_user.password_confirmation
        expect { click_on("更新する")}.to change { User.count }.by(0)
        expect(current_path).to eq user_path(sample_user)
        expect(page).to have_content "アカウントの編集に成功しました。"
    end
  end
end
