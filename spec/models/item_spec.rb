require 'rails_helper'

RSpec.describe Item, type: :model do
  it "is valid with valid attributes" do
    item = Item.new(name: "Example Item", description: "An item description", price: 10.0, stock_quantity: 50)
    expect(item).to be_valid
  end

  it "is not valid without a name" do
    item = Item.new(description: "An item description", price: 10.0, stock_quantity: 50)
    expect(item).not_to be_valid
  end

  it "is not valid without a price" do
    item = Item.new(name: "Example Item", description: "An item description", stock_quantity: 50)
    expect(item).not_to be_valid
  end

  it "is not valid without a stock_quantity" do
    item = Item.new(name: "Example Item", description: "An item description", price: 10.0)
    expect(item).not_to be_valid
  end
end
