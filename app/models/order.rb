class Order < ApplicationRecord

enum payment_method: { credit_card: 0, transfer: 1 }

belongs_to :customer
has_many :order_items, dependent: :destroy
has_many :order_item_items, through: order_items, source: item


end