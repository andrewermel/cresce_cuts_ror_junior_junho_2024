require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart) { FactoryBot.create(:cart) }
  let(:item) { FactoryBot.create(:item) }

  describe "validations" do
    it "is valid with a cart, item, and quantity" do
      cart_item = CartItem.create(cart: cart, item: item, quantity: 2)
      expect(cart_item).to be_valid
    end

    it "is not valid without a cart" do
      cart_item = CartItem.create(item: item, quantity: 2)
      expect(cart_item).not_to be_valid
    end

    it "is not valid without an item" do
      cart_item = CartItem.create(cart: cart, quantity: 2)
      expect(cart_item).not_to be_valid
    end

    it "is not valid without a quantity" do
      cart_item = CartItem.create(cart: cart, item: item)
      expect(cart_item).not_to be_valid
    end
  end

  describe "#total_price" do
    it "calculates the total price for the cart item" do
      cart_item = CartItem.create(cart: cart, item: item, quantity: 2)
      expect(cart_item.total_price).to eq(item.price * 2)
    end
  end
end
