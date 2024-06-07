# app/helpers/orders_helper.rb

module OrdersHelper
    def format_order_date(order)
      order.created_at.strftime("%B %d, %Y")
    end
  
    def order_status_label(order)
      case order.status
      when 'pending'
        'Pending'
      when 'preparing'
        'Preparing'
      when 'confirmed'
        'Confirmed'
      when 'in_transit'
        'In Transit'
      when 'ready_for_pickup'
        'Ready for Pickup'
      else
        'Unknown Status'
      end
    end
  end
  