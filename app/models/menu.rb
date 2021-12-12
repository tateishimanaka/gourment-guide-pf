class Menu < ApplicationRecord

  belongs_to :shop

  attachment :image

  validates :name, presence: true
  validates :price, presence: true

  def add_tax_price
    (self.price * 1.10).round
  end
end
