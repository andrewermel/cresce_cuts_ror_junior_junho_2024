# spec/helpers/carts_helper_spec.rb

require 'rails_helper'

RSpec.describe CartsHelper, type: :helper do
  describe "#cart_total_items" do
    it "calculates the total items in a cart" do
      cart = FactoryBot.create(:cart)
      FactoryBot.create(:cart_item, cart: cart, quantity: 2)
      FactoryBot.create(:cart_item, cart: cart, quantity: 3)
      
      expect(helper.cart_total_items(cart)).to eq(5)
    end
  end

  describe "#cart_total_price" do
    it "calculates the total price of a cart" do
      cart = FactoryBot.create(:cart)
      item1 = FactoryBot.create(:item, price: 10.0)
      item2 = FactoryBot.create(:item, price: 15.0)
      FactoryBot.create(:cart_item, cart: cart, item: item1, quantity: 2)
      FactoryBot.create(:cart_item, cart: cart, item: item2, quantity: 1)
      
      expect(helper.cart_total_price(cart)).to eq("$35.00")
    end
  end
end
