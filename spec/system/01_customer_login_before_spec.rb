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
    end
  end
end