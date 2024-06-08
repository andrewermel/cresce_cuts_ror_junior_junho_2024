# spec/requests/cart_items_spec.rb
require 'rails_helper'

RSpec.describe "/cart_items", type: :request do
  let(:customer) { Customer.create!(name: "Jane Doe", email: "jane@example.com", address: "789 Different St") }
  let(:cart) { Cart.create!(customer: customer) }
  let(:item) { Item.create!(name: "Example Item", description: "An item description", price: 10.0, stock_quantity: 50) }

  let(:valid_attributes) {
    {
      cart_id: cart.id,
      item_id: item.id,
      quantity: 2
    }
  }

  let(:invalid_attributes) {
    {
      cart_id: nil,
      item_id: nil,
      quantity: nil
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      CartItem.create! valid_attributes
      get cart_items_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      cart_item = CartItem.create! valid_attributes
      get cart_item_url(cart_item)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_cart_item_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      cart_item = CartItem.create! valid_attributes
      get edit_cart_item_url(cart_item)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new CartItem" do
        expect {
          post cart_items_url, params: { cart_item: valid_attributes }
        }.to change(CartItem, :count).by(1)
      end

      it "redirects to the created cart_item" do
        post cart_items_url, params: { cart_item: valid_attributes }
        expect(response).to redirect_to(cart_item_url(CartItem.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new CartItem" do
        expect {
          post cart_items_url, params: { cart_item: invalid_attributes }
        }.to change(CartItem, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post cart_items_url, params: { cart_item: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          quantity: 3
        }
      }

      it "updates the requested cart_item" do
        cart_item = CartItem.create! valid_attributes
        patch cart_item_url(cart_item), params: { cart_item: new_attributes }
        cart_item.reload
        expect(cart_item.quantity).to eq(3)
      end

      it "redirects to the cart_item" do
        cart_item = CartItem.create! valid_attributes
        patch cart_item_url(cart_item), params: { cart_item: new_attributes }
        expect(response).to redirect_to(cart_item_url(cart_item))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        cart_item = CartItem.create! valid_attributes
        patch cart_item_url(cart_item), params: { cart_item: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested cart_item" do
      cart_item = CartItem.create! valid_attributes
      expect {
        delete cart_item_url(cart_item)
      }.to change(CartItem, :count).by(-1)
    end

    it "redirects to the cart_items list" do
      cart_item = CartItem.create! valid_attributes
      delete cart_item_url(cart_item)
      expect(response).to redirect_to(cart_items_url)
    end
  end
end
