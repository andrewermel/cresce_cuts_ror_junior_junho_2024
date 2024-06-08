# spec/requests/carts_spec.rb
require 'rails_helper'

RSpec.describe "/carts", type: :request do
  let(:customer) { Customer.create!(name: "Jane Doe", email: "jane@example.com", address: "789 Different St") }

  let(:valid_attributes) {
    {
      customer_id: customer.id
    }
  }

  let(:invalid_attributes) {
    {
      customer_id: nil
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Cart.create! valid_attributes
      get carts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      cart = Cart.create! valid_attributes
      get cart_url(cart)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_cart_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      cart = Cart.create! valid_attributes
      get edit_cart_url(cart)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Cart" do
        expect {
          post carts_url, params: { cart: valid_attributes }
        }.to change(Cart, :count).by(1)
      end

      it "redirects to the created cart" do
        post carts_url, params: { cart: valid_attributes }
        expect(response).to redirect_to(cart_url(Cart.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Cart" do
        expect {
          post carts_url, params: { cart: invalid_attributes }
        }.to change(Cart, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post carts_url, params: { cart: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          customer_id: customer.id
        }
      }

      it "updates the requested cart" do
        cart = Cart.create! valid_attributes
        patch cart_url(cart), params: { cart: new_attributes }
        cart.reload
        expect(cart.customer_id).to eq(customer.id)
      end

      it "redirects to the cart" do
        cart = Cart.create! valid_attributes
        patch cart_url(cart), params: { cart: new_attributes }
        expect(response).to redirect_to(cart_url(cart))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested cart" do
      cart = Cart.create! valid_attributes
      expect {
        delete cart_url(cart)
      }.to change(Cart, :count).by(-1)
    end

    it "redirects to the carts list" do
      cart = Cart.create! valid_attributes
      delete cart_url(cart)
      expect(response).to redirect_to(carts_url)
    end
  end
end
