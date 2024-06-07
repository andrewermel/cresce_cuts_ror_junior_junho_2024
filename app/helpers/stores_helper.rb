# app/helpers/stores_helper.rb

module StoresHelper
    def format_store_address(store)
      "Address: #{store.address}"
    end
  
    def store_description_snippet(store)
      truncate(store.description, length: 50, separator: ' ', omission: '...')
    end
  end
  