class Seat < ApplicationRecord
  belongs_to :shop

  attachment :image
end
