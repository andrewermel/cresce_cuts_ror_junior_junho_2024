# spec/helpers/items_helper_spec.rb

require 'rails_helper'

RSpec.describe ItemsHelper, type: :helper do
  describe "#format_item_price" do
    it "formats the item price" do
      item = FactoryBot.create(:item, price: 20.50)
      expect(helper.format_item_price(item)).to eq("$20.50")
    end
  end

  describe "#item_stock_label" do
    it "returns the stock label for an item" do
      item_with_stock = FactoryBot.create(:item, stock_quantity: 10)
      item_without_stock = FactoryBot.create(:item, stock_quantity: 0)
      
      expect(helper.item_stock_label(item_with_stock)).to eq("10 in stock")
      expect(helper.item_stock_label(item_without_stock)).to eq("Out of stock")
    end
  end
end
