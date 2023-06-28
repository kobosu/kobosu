class Item < ApplicationRecord

validates :name, presence: true
validates :tax_out_price, presence: true
validates :explanation, presence: true
# validates :is_onsele, presence: true

  has_one_attached :profile_image

  has_many :order_items, dependent: :destroy
  #has_many :order_item_orders, through: order_items, source: order
  belongs_to :genre
  has_many :cart_items

  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/cake.jpeg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def with_tax_price
    (tax_out_price * 1.1).floor
  end

end
