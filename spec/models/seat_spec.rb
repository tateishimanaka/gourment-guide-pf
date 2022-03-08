# flozen_string_literal: true

require 'rails_helper'

RSpec.describe "Seatモデルに関するテスト" do
  describe "バリデーションのテスト" do
    subject { seat.valid? }

    let(:shop) { create(:shop) }
    let!(:seat) { build(:seat) }

    context "seat_typeカラム" do
      it '空欄でないこと' do
        seat.seat_type = ''
        is_expected.to eq false
      end
    end

    context "peopleカラム" do
      it "空欄でないこと" do
        seat.people = ''
        is_expected.to eq false
      end
    end
  end

  describe "アソシエーションのテスト" do
    context "Shopモデルとの関係" do
      it "N:1となっている" do
        expect(Seat.reflect_on_association(:shop).macro).to eq :belongs_to
      end
    end
  end
end