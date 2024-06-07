# db/seeds.rb

# Create some stores
store1 = Store.create(name: "Store 1", description: "Description for store 1", address: "Address 1")
store2 = Store.create(name: "Store 2", description: "Description for store 2", address: "Address 2")

# Create some customers
customer1 = Customer.create(name: "Customer 1", email: "customer1@example.com", address: "Address 1")
customer2 = Customer.create(name: "Customer 2", email: "customer2@example.com", address: "Address 2")

# Create some items
item1 = Item.create(name: "Item 1", description: "Description for item 1", price: 10.0, stock_quantity: 100)
item2 = Item.create(name: "Item 2", description: "Description for item 2", price: 20.0, stock_quantity: 200)

# Create some carts
cart1 = Cart.create(customer: customer1)
cart2 = Cart.create(customer: customer2)

# Add items to carts
CartItem.create(cart: cart1, item: item1, quantity: 2)
CartItem.create(cart: cart2, item: item2, quantity: 3)

# Create some orders
order1 = Order.create(customer: customer1, store: store1, total: 20.0, status: "pending")
order2 = Order.create(customer: customer2, store: store2, total: 60.0, status: "processing")

# Add items to orders
OrderItem.create(order: order1, item: item1, quantity: 2)
OrderItem.create(order: order2, item: item2, quantity: 3)
