# app/helpers/order_items_helper.rb

module OrderItemsHelper
    def format_order_item(order_item)
      "#{order_item.quantity} x #{order_item.item.name} (#{number_to_currency(order_item.item.price, unit: '$')})"
    end
  end
  