class Menu < ApplicationRecord

  belongs_to :shop

  attachment :image

  def add_tax_price
    (self.price * 1.10).round
  end
end
