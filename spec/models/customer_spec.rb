require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "is valid with valid attributes" do
    customer = Customer.new(name: "Jane Doe", email: "jane@example.com", address: "789 Different St")
    expect(customer).to be_valid
  end

  it "is not valid without a name" do
    customer = Customer.new(email: "jane@example.com", address: "789 Different St")
    expect(customer).not_to be_valid
  end

  it "is not valid without an email" do
    customer = Customer.new(name: "Jane Doe", address: "789 Different St")
    expect(customer).not_to be_valid
  end

  it "is not valid without an address" do
    customer = Customer.new(name: "Jane Doe", email: "jane@example.com")
    expect(customer).not_to be_valid
  end
end
