require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let!(:customer) { create(:customer, name: "John Doe", email: "john@example.com", address: "123 Main St") }
  let!(:store) { create(:store) }
  let!(:order) { create(:order, customer: customer, store: store, status: "pending", total: 100.0) }
  let(:valid_attributes) { { customer_id: customer.id, store_id: store.id, status: "confirmed", total: 150.0 } }
  let(:invalid_attributes) { { customer_id: nil, store_id: nil, status: nil, total: nil } }

  describe "GET #index" do
    it "assigns all orders as @orders" do
      get :index
      expect(assigns(:orders)).to eq([order])
    end
  end

  describe "GET #show" do
    it "assigns the requested order as @order" do
      get :show, params: { id: order.to_param }
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "GET #new" do
    it "assigns a new order as @order" do
      get :new
      expect(assigns(:order)).to be_a_new(Order)
    end
  end

  describe "GET #edit" do
    it "assigns the requested order as @order" do
      get :edit, params: { id: order.to_param }
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, params: { order: valid_attributes }
        }.to change(Order, :count).by(1)
      end

      it "assigns a newly created order as @order" do
        post :create, params: { order: valid_attributes }
        expect(assigns(:order)).to be_a(Order)
        expect(assigns(:order)).to be_persisted
      end

      it "redirects to the created order" do
        post :create, params: { order: valid_attributes }
        expect(response).to redirect_to(Order.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved order as @order" do
        post :create, params: { order: invalid_attributes }
        expect(assigns(:order)).to be_a_new(Order)
      end

      it "re-renders the 'new' template" do
        post :create, params: { order: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { status: "processing", total: 200.0 } }

      it "updates the requested order" do
        put :update, params: { id: order.to_param, order: new_attributes }
        order.reload
        expect(order.status).to eq("processing")
        expect(order.total).to eq(200.0)
      end

      it "assigns the requested order as @order" do
        put :update, params: { id: order.to_param, order: valid_attributes }
        expect(assigns(:order)).to eq(order)
      end

      it "redirects to the order" do
        put :update, params: { id: order.to_param, order: valid_attributes }
        expect(response).to redirect_to(order)
      end
    end

    context "with invalid params" do
      it "assigns the order as @order" do
        put :update, params: { id: order.to_param, order: invalid_attributes }
        expect(assigns(:order)).to eq(order)
      end

      it "re-renders the 'edit' template" do
        put :update, params: { id: order.to_param, order: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested order" do
      expect {
        delete :destroy, params: { id: order.to_param }
      }.to change(Order, :count).by(-1)
    end

    it "redirects to the orders list" do
      delete :destroy, params: { id: order.to_param }
      expect(response).to redirect_to(orders_url)
    end
  end
end
