# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favoriteモデルのテスト' do
  describe 'アソシエーションのテスト' do
    context 'Shopモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:shop).macro).to eq :belongs_to
      end
    end

    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end