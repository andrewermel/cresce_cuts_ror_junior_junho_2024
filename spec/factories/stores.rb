# spec/factories/stores.rb

FactoryBot.define do
    factory :store do
      name { "Example Store" }
      description { "Lorem ipsum dolor sit amet" }
      address { "123 Main St" }
    end
  end
  