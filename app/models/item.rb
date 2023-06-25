class Item < ApplicationRecord
  
  has_many :order_items, dependent: :destroy
  has_many :order_item_orders, through: order_items, source: order
  
end
