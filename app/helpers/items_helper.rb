# app/helpers/items_helper.rb

module ItemsHelper
    def format_item_price(item)
      number_to_currency(item.price, unit: "$")
    end
  
    def item_stock_label(item)
      if item.stock_quantity > 0
        "#{item.stock_quantity} in stock"
      else
        "Out of stock"
      end
    end
  end
  