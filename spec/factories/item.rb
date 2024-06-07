# spec/factories/items.rb

FactoryBot.define do
    factory :item do
      name { "Example Item" }
      description { "Lorem ipsum dolor sit amet" }
      price { 10.0 }
      stock_quantity { 50 }
    end
  end
  