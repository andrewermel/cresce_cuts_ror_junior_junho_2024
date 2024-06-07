require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let!(:customer) { Customer.create!(name: "John Doe", email: "john@example.com", address: "123 Main St") }
  let!(:customer2) { Customer.create!(name: "Nelson Doe", email: "j1ohn@example.com", address: "123 Main St") }
  let!(:valid_attributes) { { customer_id: customer.id } }

  describe "GET index" do
    it "assigns all carts as @carts" do
      cart = Cart.create!(valid_attributes)
      get :index
      expect(assigns(:carts)).to eq([cart])
    end
  end

  describe "GET show" do
    it "assigns the requested cart as @cart" do
      cart = Cart.create!(valid_attributes)
      get :show, params: { id: cart.to_param }
      expect(assigns(:cart)).to eq(cart)
    end
  end

  describe "GET new" do
    it "assigns a new cart as @cart" do
      get :new
      expect(assigns(:cart)).to be_a_new(Cart)
    end
  end

  describe "GET edit" do
    it "assigns the requested cart as @cart" do
      cart = Cart.create!(valid_attributes)
      get :edit, params: { id: cart.to_param }
      expect(assigns(:cart)).to eq(cart)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Cart" do
        expect {
          post :create, params: { cart: valid_attributes }
        }.to change(Cart, :count).by(1)
      end

      it "assigns a newly created cart as @cart" do
        post :create, params: { cart: valid_attributes }
        expect(assigns(:cart)).to be_a(Cart)
        expect(assigns(:cart)).to be_persisted
      end

      it "redirects to the created cart" do
        post :create, params: { cart: valid_attributes }
        expect(response).to redirect_to(Cart.last)
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do
      let(:new_attributes) { { customer_id: 2 } }

      it "updates the requested cart" do
        cart = Cart.create!(valid_attributes.merge(customer_id: 1))
        put :update, params: { id: cart.to_param, cart: new_attributes }
        cart.reload
        expect(cart.customer_id).to eq(2)
      end

      it "assigns the requested cart as @cart" do
        cart = Cart.create!(valid_attributes)
        put :update, params: { id: cart.to_param, cart: valid_attributes }
        expect(assigns(:cart)).to eq(cart)
      end

      it "redirects to the cart" do
        cart = Cart.create!(valid_attributes)
        put :update, params: { id: cart.to_param, cart: valid_attributes }
        expect(response).to redirect_to(cart)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cart" do
      cart = Cart.create!(valid_attributes)
      expect {
        delete :destroy, params: { id: cart.to_param }
      }.to change(Cart, :count).by(-1)
    end

    it "redirects to the carts list" do
      cart = Cart.create!(valid_attributes)
      delete :destroy, params: { id: cart.to_param }
      expect(response).to redirect_to(carts_url)
    end
  end
end
