# app/helpers/carts_helper.rb

module CartsHelper
    def cart_total_items(cart)
      cart.cart_items.sum(:quantity)
    end
  
    def cart_total_price(cart)
      total_price = cart.cart_items.includes(:item).sum { |ci| ci.quantity * ci.item.price }
      number_to_currency(total_price, unit: "$")
    end
  end
  