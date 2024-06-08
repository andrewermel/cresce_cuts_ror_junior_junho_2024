require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:customer) { Customer.create(name: "Jane Doe", email: "jane@example.com", address: "789 Different St") }
  let(:store) { Store.create(name: "Example Store", description: "A store description", address: "123 Main St") }
  let(:item) { Item.create(name: "Example Item", description: "An item description", price: 10.0, stock_quantity: 50) }
  let(:cart) { Cart.create(customer: customer) }

  it "is valid with a customer" do
    expect(cart).to be_valid
  end

  it "is not valid without a customer" do
    cart_without_customer = Cart.new
    expect(cart_without_customer).not_to be_valid
  end
end
