# spec/helpers/order_items_helper_spec.rb

require 'rails_helper'

RSpec.describe OrderItemsHelper, type: :helper do
  describe "#format_order_item" do
    it "formats the order item" do
      item = FactoryBot.create(:item, price: 10.0) # Certifique-se de definir o preço com duas casas decimais
      order_item = FactoryBot.create(:order_item, item: item, quantity: 3)

      # Use sprintf para garantir que o preço seja formatado com duas casas decimais
      expect(helper.format_order_item(order_item)).to eq("3 x #{item.name} ($#{sprintf('%.2f', item.price)})")
    end
  end
end
