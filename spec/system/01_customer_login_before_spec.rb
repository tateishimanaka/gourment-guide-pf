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

      it '「お店の情報を公開」のリンクが表示される' do
        shop_link = find_all('a')[1].native.inner_text
        expect(shop_link).to match "お店の情報を公開"
      end
    end
  end
end