# spec/helpers/orders_helper_spec.rb

require 'rails_helper'

RSpec.describe OrdersHelper, type: :helper do
  describe "#format_order_date" do
    it "formats the order date" do
      order = FactoryBot.create(:order, created_at: Date.new(2024, 6, 10))
      expect(helper.format_order_date(order)).to eq("June 10, 2024")
    end
  end

  describe "#order_status_label" do
    it "returns the label for order status" do
      order = FactoryBot.create(:order, status: "confirmed")
      expect(helper.order_status_label(order)).to eq("Confirmed")
    end
  end
end
