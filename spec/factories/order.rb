# spec/factories/orders.rb

FactoryBot.define do
    factory :order do
      total { 100.0 }
      status { "pending" }
      association :customer
      association :store
    end
  end
  