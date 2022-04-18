# flozen_string_literal: true

require 'rails_helper'

describe '[step1]customerログイン前のテスト' do
  describe 'トップ画面のテスト' do
    let!(:shop) { create(:shop) }

    before do
      visit root_path
    end

    context '表示の内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'サイトの名前が表示されている' do
        expect(page).to have_content 'Gourment Guide'
      end
      it '「お店の情報を公開」のリンクが表示される: 左から１番目のリンクが「お店の情報を公開する」である' do
        shop_link = find_all('a')[1].native.inner_text
        expect(shop_link).to match "お店の情報を公開"
      end
      it '「お店の情報を公開」のリンクの内容が正しい' do
        shop_link = find_all('a')[1].native.inner_text
        expect(page).to have_link shop_link, href: restaurant_about_path
      end
      it '「お店を探す」のリンクが表示される: 左から２番目のリンクが「お店を探す」である' do
        customer_link = find_all('a')[2].native.inner_text
        expect(customer_link).to match "お店を探す"
      end
      it '「お店を探す」のリンクの内容が正しい' do
        customer_link = find_all('a')[2].native.inner_text
        expect(page).to have_link customer_link, href: about_path
      end
      it '「shop List」のリンクが表示される: 左から３番目のリンクが「shop List」である' do
        shop_list_link = find_all('a')[3].native.inner_text
        expect(shop_list_link).to match "shop List"
      end
      it '「shop List」のリンクの内容が正しい' do
        shop_list_link = find_all('a')[3].native.inner_text
        expect(page).to have_link shop_list_link, href: shops_path
      end
    end

    context 'リンクの遷移先の確認' do
      it '「お店の情報を公開」を押すと、飲食店側のアバウト画面に遷移する' do
        shop_link = find_all('a')[1]
        shop_link.click
        expect(page).to have_current_path restaurant_about_path
      end
      it '「お店を探す」を押すと、一般会員側のアバウト画面に遷移する' do
        customer_link = find_all('a')[2]
        customer_link.click
        expect(page).to have_current_path about_path
      end
      it '「shop Link」を押すと、飲食店一覧の画面に遷移する' do
        shop_list_link = find_all('a')[3]
        shop_list_link.click
        expect(page).to have_current_path shops_path
      end
    end

    context '一覧の表示' do
      it '店名は表示されているか' do
        expect(page).to have_content shop.shop_name
      end
    end
  end

  describe '飲食店側アバウト画面のテスト' do
    before do
      visit restaurant_about_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/restaurant/about'
      end
      it '「gourment guide Shop」と表示されているか' do
        expect(page).to have_content 'gourment guide Shop'
      end
      it '「ログイン」のリンクが表示される' do
        shop_login_link = find_all('a')[4].native.inner_text
        expect(shop_login_link).to match "ログイン"
      end
      it '「ログイン」のリンクの内容が正しい' do
        shop_login_link = find_all('a')[4]
        shop_login_link.click
        expect(page).to have_current_path new_shop_session_path
      end
      it '「新規会員登録」のリンクが表示される' do
        shop_registration_link = find_all('a')[5].native.inner_text
        expect(shop_registration_link).to match "新規会員登録"
      end
      it '「新規会員登録」のリンクの内容が正しい' do
        shop_registration_link = find_all('a')[5]
        shop_registration_link.click
        expect(page).to have_current_path new_shop_registration_path
      end
    end

    context 'リンクの遷移先の確認' do
      it 'ログインを押すと、飲食店側のログイン画面に遷移する' do
        login_link = find_all('a')[4]
        login_link.click
        expect(current_path).to eq '/shop/sign_in'
      end
      it '新規登録を押すと、飲食店側の新規会員登録が目に遷移する' do
        registration_link = find_all('a')[5]
        registration_link.click
        expect(current_path).to eq '/shop/sign_up'
      end
    end
  end

  describe '飲食店側新規登録画面のテスト' do
    before do
      visit new_shop_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/shop/sign_up'
      end
      it '「gourment-guide-shop新規会員登録」と表示される' do
        expect(page).to have_content 'gourment-guide-shop新規会員登録'
      end
      it 'shop_nameフォームが表示される' do
        expect(page).to have_field 'shop[shop_name]'
      end
      it 'shop_name_kanaフォームが表示される' do
        expect(page).to have_field 'shop[shop_name_kana]'
      end
       it 'imageフォームが表示される' do
        expect(page).to have_field 'shop[image]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'shop[email]'
      end
      it 'telephone_numberフォームが表示される' do
        expect(page).to have_field 'shop[telephone_number]'
      end
      it 'postal_codeフォームが表示される' do
        expect(page).to have_field 'shop[postal_code]'
      end
      it 'addressフォームが表示される' do
        expect(page).to have_field 'shop[address]'
      end
      it 'accessフォームが表示される' do
        expect(page).to have_field 'shop[access]'
      end
      it 'opening_hoursフォームが表示される' do
        expect(page).to have_field 'shop[opening_hours]'
      end
      it 'holidayフォームが表示される' do
        expect(page).to have_field 'shop[holiday]'
      end
      it 'genreフォームが表示される' do
        expect(page).to have_field 'shop[genre]'
      end
      it 'payment_methodフォームが表示される' do
        expect(page).to have_field 'shop[payment_method]'
      end
      it 'smokingフォームが表示される' do
        expect(page).to have_field 'shop[smoking]'
      end
      it 'childrenフォームが表示される' do
        expect(page).to have_field 'shop[children]'
      end
      it 'wait_timeフォームが表示される' do
        expect(page).to have_field 'shop[wait_time]'
      end
      it 'introductionフォームが表示される' do
        expect(page).to have_field 'shop[introduction]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'shop[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'shop[password_confirmation]'
      end
      it '「登録する」ボタンが表示される' do
        expect(page).to have_button '登録する'
      end
    end

    context '新規登録成功のテスト' do
      # before do
      #   fill_in 'shop[shop_name]', with: Faker::Lorem.characters(number: 10)
      #   fill_in 'shop[shop_name_kana]', with: Faker::Lorem.characters(number: 20)
      #   fill_in 'shop[email]', with: Faker::Internet.email
      #   fill_in 'shop[password]', with: 'password'
      #   fill_in 'shop[password_confirmation]', with: 'password'
      # end

      # it '正しく登録される' do
      #   expect { click_button '登録する' }.to change(Shop.all, :count).by(1)
      # end
      it '有効な場合は登録されるか' do
        expect(FactoryBot.build(:shop)).to be_valid
      end
      it '登録できるか' do
        fill_in 'shop[shop_name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'shop[shop_name_kana]', with: Faker::Lorem.characters(number: 20)
        fill_in 'shop[email]', with: Faker::Internet.email
        fill_in 'shop[password]', with: 'password'
        fill_in 'shop[password_confirmation]', with: 'password'
        click_button '登録する'
        expect(current_path).to eq '/restaurant/shops'
      end
    end

  end

  describe '飲食店側ログイン画面のテスト' do
    let(:shop) { create(:shop) }
    before do
      visit new_shop_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/shop/sign_in'
      end
      it '「gourment-guide-shopログイン」と表示されている' do
        expect(page).to have_content 'gourment-guide-shopログイン'
      end
      it '「こちら」のリンクが表示される' do
        shop_registration_link = find_all('a')[4].native.inner_text
        expect(shop_registration_link).to match "こちら"
      end
      # it '「こちら」のリンクの内容が、飲食店側の新規登録のリンクである' do
      #   shop_registration_link = find_all('a')[4]
      #   expect(shop_registration_link).to match '/shop/sign_up'
      # end
      it '「こちら」のリンクの内容が正しい' do
        shop_registration_link = find_all('a')[4]
        shop_registration_link.click
        expect(page).to have_current_path new_shop_registration_path
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'shop[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'shop[password]'
      end
      it '「ログイン」ボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'shop[email]', with: shop.email
        fill_in 'shop[password]', with: shop.password
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先が店の詳細画面になっている' do
        expect(current_path).to eq '/restaurant/shops'
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'shop[email]', with: ''
        fill_in 'shop[password]', with: ''
        click_button 'ログイン'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/shop/sign_in'
      end
    end
  end

  describe '飲食店側ヘッダーのテスト: ログインしている場合' do
    let(:shop) { create(:shop) }

    before do
      visit new_shop_session_path
      fill_in 'shop[email]', with: shop.email
      fill_in 'shop[password]', with: shop.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      it 'タイトルが表示される' do
        expect(page).to have_content 'Gourment Guide'
      end
      it 'Logoutリンクが表示される: 左上から１番目のリンクが「Logout」である' do
        logout_link = find_all('a')[1].native.inner_text
        expect(logout_link).to match 'Logout'
      end
      it 'Shop Listリンクが表示される' do
        shop_list_link = find_all('a')[2].native.inner_text
        expect(shop_list_link).to match 'Shop List'
      end
      it 'My Pageリンクが表示される' do
        mypage_link = find_all('a')[3].native.inner_text
        expect(mypage_link).to match 'My Page'
      end
    end
  end

  describe 'ユーザーログアウトのテスト' do
    let(:shop) { create(:shop) }

    before do
      visit new_shop_session_path
      fill_in 'shop[email]', with: shop.email
      fill_in 'shop[password]', with: shop.password
      click_button 'ログイン'
      logout_link = find_all('a')[1].native.inner_text
      click_link logout_link
    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてトップ画面のリンクが存在する' do
        expect(page).to have_link '', href: '/'
      end
      it 'ログアウト後のリダイレクト先が、飲食店側のアバウト画面になっている' do
        expect(current_path).to eq '/restaurant/about'
      end
    end
  end

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
end