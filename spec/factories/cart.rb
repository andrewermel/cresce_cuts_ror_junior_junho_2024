# spec/factories/carts.rb

FactoryBot.define do
    factory :cart do
      association :customer
    end
  end
  