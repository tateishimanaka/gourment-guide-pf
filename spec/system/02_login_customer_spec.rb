# flozen_string_literal: true

require 'rails_helper'

describe '[STEP2]一般会員側ログインのテスト' do
  describe '一般会員側のアバウト画面のテスト' do
    before do
      visit about_path
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/about'
      end
      it '「gourment guide」と表示される' do
        expect(page).to have_content 'gourment guide'
      end
      it '「ログイン」リンクが表示される' do
        customer_login_link = find_all('a')[4].native.inner_text
        expect(customer_login_link).to match 'ログイン'
      end
      it 'ログインリンクの内容が正しい' do
        customer_login_link = find_all('a')[4].native.inner_text
        expect(page).to have_link customer_login_link, href: new_customer_session_path
      end
      it '「新規登録」リンクが表示される' do
        customer_registration_link = find_all('a')[5].native.inner_text
        expect(customer_registration_link).to match '新規登録'
      end
      it '新規登録リンクの内容が正しい' do
        customer_registration_link = find_all('a')[5].native.inner_text
        expect(page).to have_link customer_registration_link, href: new_customer_registration_path
      end
    end

    context 'リンクの遷移先の確認' do
      it 'ログインを押すと、一般会員側のログイン画面に遷移する' do
        customer_login_link = find_all('a')[4]
        customer_login_link.click
        expect(current_path).to eq '/customer/sign_in'
      end
      it '新規登録を押すと、一般会員側の新規会員登録画面に遷移する' do
        customer_registration_link = find_all('a')[5]
        customer_registration_link.click
        expect(current_path).to eq '/customer/sign_up'
      end
    end
  end

  describe '一般会員新規登録のテスト' do
    before do
      visit new_customer_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/customer/sign_up'
      end
      it '「新規会員登録」と表示される' do
        expect(page).to have_content '新規会員登録'
      end
      it 'last_nameフォームが表示される' do
        expect(page).to have_field 'customer[last_name]'
      end
      it 'first_nameフォームが表示される' do
        expect(page).to have_field 'customer[first_name]'
      end
      it 'last_name_kanaフォームが表示される' do
        expect(page).to have_field 'customer[last_name_kana]'
      end
      it 'first_name_kanaフォームが表示される' do
        expect(page).to have_field 'customer[first_name_kana]'
      end
      it 'postal_codeフォームが表示される' do
        expect(page).to have_field 'customer[postal_code]'
      end
      it 'addressフォームが表示される' do
        expect(page).to have_field 'customer[address]'
      end
      it 'telephone_numberフォームが表示される' do
        expect(page).to have_field 'customer[telephone_number]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'customer[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'customer[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'customer[password_confirmation]'
      end
      it '「登録」ボタンが表示される' do
        expect(page).to have_button '登録'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'customer[last_name]', with: Faker::Lorem.characters(number: 2)
        fill_in 'customer[first_name]', with: Faker::Lorem.characters(number: 2)
        fill_in 'customer[last_name_kana]', with: Faker::Lorem.characters(number: 5)
        fill_in 'customer[first_name_kana]', with: Faker::Lorem.characters(number: 3)
        fill_in 'customer[postal_code]', with: Faker::Lorem.characters(number: 7)
        fill_in 'customer[address]', with: Faker::Lorem.characters(number: 7)
        fill_in 'customer[telephone_number]', with: Faker::Lorem.characters(number: 10)
        fill_in 'customer[password]', with: 'password'
        fill_in 'customer[password_confirmation]', with: 'password'
        fill_in 'customer[email]', with: Faker::Internet.email
      end

      it '正しく登録される' do
        expect { click_button '登録' }.to change(Customer.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先がトップページである' do
        click_button '登録'
        expect(current_path).to eq '/'
      end
    end
  end

  describe '一般会員ログイン' do
    let(:customer) { create(:customer) }

    before do
      visit new_customer_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/customer/sign_in'
      end

      it '「一般会員ログイン画面」と表示される' do
        expect(page).to have_content '一般会員ログイン画面'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'customer[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'customer[password]'
      end
      it '「ログイン」ボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'customer[email]', with: customer.email
        fill_in 'customer[password]', with: customer.password
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先が、店舗一覧画面になっている' do
        expect(current_path).to eq '/shops'
      end
    end

    context 'ログイン失敗' do
      before do
        fill_in 'customer[email]', with: ''
        fill_in 'customer[password]', with: ''
        click_button 'ログイン'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/customer/sign_in'
      end
    end
  end

  describe 'ヘッダーのテスト:　ログインしている場合' do
    let(:customer) { create(:customer) }

    before do
      visit new_customer_session_path
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      it 'タイトルが表示される' do
        expect(page).to have_content 'Gourment Guide'
      end
      it 'Logoutリンクが表示される' do
        logout_link = find_all('a')[1].native.inner_text
        expect(logout_link).to match 'Logout'
      end
    end
  end

  describe '一般会員ログアウトのテスト' do
    let(:customer) { create(:customer) }

    before do
      visit new_customer_session_path
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'ログイン'
      logout_link = find_all('a')[1].native.inner_text
      click_link logout_link
    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできているか: ログアウト後のリダイレクト先においてトップ画面のリンクが存在する' do
        expect(page).to have_link '', href: '/'
      end
      it 'ログアウト後のリダイレクト先が、トップ画面になっている' do
        expect(current_path).to eq '/'
      end
    end
  end
end
