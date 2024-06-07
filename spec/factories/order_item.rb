# spec/factories/order_items.rb

FactoryBot.define do
    factory :order_item do
      association :order
      association :item
      quantity { 1 }
    end
  end
  