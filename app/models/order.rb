# app/models/order.rb
class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :store
  has_many :order_items
  has_many :items, through: :order_items
  validates :total, :status, presence: true

  enum status: { pending: 'pending', processing: 'processing', confirmed: 'confirmed', on_route: 'on_route', available_for_pickup: 'available_for_pickup' }
end
