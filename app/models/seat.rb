class Seat < ApplicationRecord
  belongs_to :shop

  validates :seat_type, presence: true
  validates :people, presence: true

  attachment :image
end
