# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customerモデルのテスト' do
  describe 'バリデーションのテスト' do
    subject { customer.valid? }

    let(:customer) { build(:customer) }

    context 'last_nameカラム' do
      it '空欄でないこと' do
        customer.last_name = ''
        is_expected.to eq false
      end
    end
  end
end