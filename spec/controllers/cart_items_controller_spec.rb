# spec/controllers/cart_items_controller_spec.rb

require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do
  describe "GET index" do
    it "assigns all cart items as @cart_items" do
      cart_item = FactoryBot.create(:cart_item)
      get :index
      expect(assigns(:cart_items)).to eq([cart_item])
    end
  end

  describe "GET show" do
    it "assigns the requested cart item as @cart_item" do
      cart_item = FactoryBot.create(:cart_item)
      get :show, params: { id: cart_item.id }
      expect(assigns(:cart_item)).to eq(cart_item)
    end
  end

  describe "GET new" do
    it "assigns a new cart item as @cart_item" do
      get :new
      expect(assigns(:cart_item)).to be_a_new(CartItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested cart item as @cart_item" do
      cart_item = FactoryBot.create(:cart_item)
      get :edit, params: { id: cart_item.id }
      expect(assigns(:cart_item)).to eq(cart_item)
    end
  end

  describe "POST create" do
    context "with valid parameters" do
        it "creates a new cart item" do
          cart_item = FactoryBot.create(:cart_item)
          expect {
            post :create, params: { cart_item: { cart_id: cart_item.cart_id, item_id: cart_item.item_id, quantity: 1 } }
          }.to change(CartItem, :count).by(1)
        end
      end

    context "with invalid parameters" do
      it "does not create a new cart item" do
        expect {
          post :create, params: { cart_item: { cart_id: nil, item_id: nil, quantity: nil } }
        }.to_not change(CartItem, :count)
      end
    end
  end

  describe "PATCH update" do
    context "with valid parameters" do
      it "updates the requested cart item" do
        cart_item = FactoryBot.create(:cart_item)
        new_quantity = 5
        patch :update, params: { id: cart_item.id, cart_item: { quantity: new_quantity } }
        cart_item.reload
        expect(cart_item.quantity).to eq(new_quantity)
      end
    end

    context "with invalid parameters" do
      it "does not update the requested cart item" do
        cart_item = FactoryBot.create(:cart_item)
        old_quantity = cart_item.quantity
        patch :update, params: { id: cart_item.id, cart_item: { quantity: nil } }
        cart_item.reload
        expect(cart_item.quantity).to eq(old_quantity)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cart item" do
      cart_item = FactoryBot.create(:cart_item)
      expect {
        delete :destroy, params: { id: cart_item.id }
      }.to change(CartItem, :count).by(-1)
    end
  end
end
