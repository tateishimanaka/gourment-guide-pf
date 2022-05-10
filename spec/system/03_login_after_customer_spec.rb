#　flozen_string_literal: true

require 'rails_helper'

describe '一般会員ログイン後のテスト' do
  let(:customer) { create(:customer) }
  let!(:shop) { create(:shop) }
end