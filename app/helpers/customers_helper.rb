# app/helpers/customers_helper.rb

module CustomersHelper
    def customer_full_info(customer)
      "Customer: #{customer.name}, Email: #{customer.email}, Address: #{customer.address}"
    end
  
    def format_customer_address(customer)
      "Address: #{customer.address}"
    end
  end
  