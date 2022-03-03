# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Shopモデルに関するテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { shop.valid? }

    let(:shop) { build(:shop) }

    context 'shop_nameカラム' do
      it '空欄でないこと' do
        shop.shop_name = ''
        is_expected.to eq false
      end
    end

    context 'shop_name_kanaカラム' do
      it '空欄でないこと' do
        shop.shop_name_kana = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Menuモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:menus).macro).to eq :has_many
      end
    end

    context 'Seatモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:seats).macro).to eq :has_many
      end
    end

    context 'Imageモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:images).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
  end
end