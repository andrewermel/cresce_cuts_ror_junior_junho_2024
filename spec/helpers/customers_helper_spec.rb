# spec/helpers/customers_helper_spec.rb

require 'rails_helper'

RSpec.describe CustomersHelper, type: :helper do
  describe "#customer_full_info" do
    it "returns the full information of a customer" do
      customer = FactoryBot.create(:customer, name: "John Doe", email: "john@example.com", address: "123 Main St")
      expect(helper.customer_full_info(customer)).to eq("Customer: John Doe, Email: john@example.com, Address: 123 Main St")
    end
  end

  describe "#format_customer_address" do
    it "formats the customer address" do
      customer = FactoryBot.create(:customer, address: "123 Main St")
      expect(helper.format_customer_address(customer)).to eq("Address: 123 Main St")
    end
  end
end
