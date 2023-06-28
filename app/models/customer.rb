class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :address, uniqueness: true

  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy

end
