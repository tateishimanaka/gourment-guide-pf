# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shop, "モデルに関するテスト" do
  describe '実際に保存してみる' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:shop)).to be_valid
    end
  end
end