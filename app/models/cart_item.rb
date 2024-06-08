# app/models/cart_item.rb
class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
  validates :cart, :item, :quantity, presence: true

  def total_price
   item.price * quantity
  end
end
