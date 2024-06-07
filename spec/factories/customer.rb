# spec/factories/customers.rb

FactoryBot.define do
    factory :customer do
      name { "John Doe" }
      email { "john@example.com" }
      address { "123 Main St" }
    end
  end
  