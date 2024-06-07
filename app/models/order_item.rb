# app/models/order_item.rb
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  validates :quantity, presence: true
end
