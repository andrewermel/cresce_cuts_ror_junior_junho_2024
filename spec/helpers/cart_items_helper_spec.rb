# spec/helpers/cart_items_helper_spec.rb

require 'rails_helper'

RSpec.describe CartItemsHelper, type: :helper do
  describe "#format_quantity" do
    it "formats the quantity with a label" do
      expect(helper.format_quantity(5)).to eq("Quantity: 5")
    end
  end
end
