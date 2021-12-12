class Image < ApplicationRecord
  belongs_to :shop

  attachment :image

  validates :image, presence: true

end
