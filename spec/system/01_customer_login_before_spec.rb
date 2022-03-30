# flozen_string_literal: true

require 'rails_helper'

describe '[step1]customerログイン前のテスト' do
  describe 'トップ画面のテスト' do
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

      it '「お店を探す」のリンクが表示される: 左から２番目のリンクが「お店を探す」である' do
        customer_link = find_all('a')[2].native.inner_text
        expect(customer_link).to match "お店を探す"
      end

      it '「shop List」のリンクが表示される: 左から３番目のリンクが「shop List」である' do
        shop_list_link = find_all('a')[3].native.inner_text
        expect(shop_list_link).to match "shop List"
      end
    end
  end
end