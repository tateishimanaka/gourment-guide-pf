class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :seats, dependent: :destroy

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  enum reserve: { reserve_only: 0, reserve_possible: 1, reserve_impossible: 2 }

  attachment :image


  def active_for_authentication?
    super && (is_deleted == false)
  end
end
