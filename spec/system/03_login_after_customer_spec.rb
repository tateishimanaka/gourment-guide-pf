#　flozen_string_literal: true

require 'rails_helper'

describe '一般会員ログイン後のテスト' do
  let(:customer) { create(:customer) }
  let!(:shop) { create(:shop) }
  
  before do
    visit new_customer_session_path
    fill_in 'customer[email]', with: customer.email
    
  end
end