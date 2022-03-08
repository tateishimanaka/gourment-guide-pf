# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Commentモデルのテスト' do
  describe "バリデーションのテスト" do
    subject { comment.valid? }
    
    let(:shop) { create(:comment) }
    let(:customer) { create(:customer) }
    let!(:comment) { build(:comment) }
    
    context 'rateカラム' do
      it '空欄でないこと' do
        comment.rate = ""
        is_expected.to eq false 
      end
    end
  end
  
  describe 'アソシエーションのテスト' do
    context 'Shopモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:shop).macro).to eq :belongs_to
      end
    end
    
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end