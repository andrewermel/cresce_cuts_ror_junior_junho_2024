# app/models/cart.rb
class Cart < ApplicationRecord
  belongs_to :customer
  has_many :cart_items
  has_many :items, through: :cart_items

  def add_item(item, quantity = 1)
    cart_item = cart_items.find_or_initialize_by(item_id: item.id)
    cart_item.quantity += quantity
    cart_item.save!
  end

  def total_price
    items.sum { |item| item.price * cart_items.find_by(item_id: item.id).quantity }
  end
end
