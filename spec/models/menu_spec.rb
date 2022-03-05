# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Menuモデルのテスト' do
  describe 'バリデーションのテスト' do
    subject { menu.valid? }

    let(:shop) { create(:shop) }
    let!(:menu) { build(:menu) }

    context 'nameカラム' do
      it '空欄でないこと' do
        menu.name = ''
        is_expected.to eq false
      end
    end

    context 'priceカラム' do
      it '空欄でないこと' do
        menu.price = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Shopモデルとの関係' do
      it 'N:1となっている' do
        expect(Menu.reflect_on_association(:shop).macro).to eq :belongs_to
      end
    end
  end
end