require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:order) { Order.create }
  let(:item) { Item.create }

  describe "is valid with valid attributes" do
    it "creates a new order item" do
      order_item = OrderItem.new(order: order, item: item, quantity: 2) # Removemos o atributo price
      expect(order_item).to be_valid
    end
  end

  describe "is not valid without an order" do
    it "raises a validation error" do
      order_item = OrderItem.new(item: item, quantity: 2) # Removemos o atributo price
      expect(order_item).not_to be_valid
    end
  end

  describe "is not valid without an item" do
    it "raises a validation error" do
      order_item = OrderItem.new(order: order, quantity: 2) # Removemos o atributo price
      expect(order_item).not_to be_valid
    end
  end

  describe "is not valid without a quantity" do
    it "raises a validation error" do
      order_item = OrderItem.new(order: order, item: item) # Removemos o atributo price
      expect(order_item).not_to be_valid
    end
  end
end
