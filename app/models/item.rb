# app/models/item.rb
class Item < ApplicationRecord
    has_many :cart_items
    has_many :carts, through: :cart_items
    has_many :order_items
    has_many :orders, through: :order_items
    validates :name, :description, :price, :stock_quantity, presence: true
  end
  