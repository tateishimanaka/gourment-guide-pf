# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Imageモデルのテスト' do
  describe 'バリデーションのテスト' do
    subject { image.valid? }

    let(:shop) { create(:shop) }
    let!(:image) { build(:image) }

    context 'imageカラム' do
      it '空欄でないこと' do
        image.image = ''
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '空欄でないこと' do
        image.introduction = ''
        is_expected.to eq false
      end
    end
  end
  
  describe 'アソシエーションのテスト' do
    context 'Shopモデルとの関係' do
      it 'N:1となっている' do
        expect(Image.reflect_on_association(:shop).macro).to eq :belongs_to
      end
    end
  end
end