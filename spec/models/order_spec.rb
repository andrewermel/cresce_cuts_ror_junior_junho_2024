require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:customer) { Customer.create(name: "Jane Doe", email: "jane@example.com", address: "789 Different St") }
  let(:store) { Store.create(name: "Example Store", description: "A store description", address: "123 Main St") }

  it "is valid with valid attributes" do
    order = Order.new(customer: customer, store: store, status: "pending", total: 100.0)
    expect(order).to be_valid
  end

  it "is not valid without a customer" do
    order = Order.new(store: store, status: "pending", total: 100.0)
    expect(order).not_to be_valid
  end

  it "is not valid without a store" do
    order = Order.new(customer: customer, status: "pending", total: 100.0)
    expect(order).not_to be_valid
  end

  it "is not valid without a total" do
    order = Order.new(customer: customer, store: store, status: "pending")
    expect(order).not_to be_valid
  end

  it "is not valid without a status" do
    order = Order.new(customer: customer, store: store, total: 100.0)
    expect(order).not_to be_valid
  end
end
