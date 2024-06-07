# spec/controllers/order_items_controller_spec.rb

require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  let(:order) { FactoryBot.create(:order) }
  let(:item) { FactoryBot.create(:item) }
  let(:valid_params) { { order_item: { order_id: order.id, item_id: item.id, quantity: 2 } } }
  let(:invalid_params) { { order_item: { order_id: nil, item_id: item.id, quantity: 2 } } }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      order_item = OrderItem.create! valid_params[:order_item]
      get :show, params: { id: order_item.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      order_item = OrderItem.create! valid_params[:order_item]
      get :edit, params: { id: order_item.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new order item" do
        expect {
          post :create, params: valid_params
        }.to change(OrderItem, :count).by(1)
      end

      it "redirects to the created order item" do
        post :create, params: valid_params
        expect(response).to redirect_to(order_item_url(OrderItem.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new order item" do
        expect {
          post :create, params: invalid_params
        }.not_to change(OrderItem, :count)
      end

      it "re-renders the 'new' template" do
        post :create, params: invalid_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH #update" do
    let(:new_attributes) { { quantity: 3 } }

    context "with valid parameters" do
      it "updates the requested order item" do
        order_item = OrderItem.create! valid_params[:order_item]
        patch :update, params: { id: order_item.to_param, order_item: new_attributes }
        order_item.reload
        expect(order_item.quantity).to eq(3)
      end

      it "redirects to the order item" do
        order_item = OrderItem.create! valid_params[:order_item]
        patch :update, params: { id: order_item.to_param, order_item: new_attributes }
        expect(response).to redirect_to(order_item_url(order_item))
      end
    end

    context "with invalid parameters" do
      it "renders the 'edit' template" do
        order_item = OrderItem.create! valid_params[:order_item]
        patch :update, params: { id: order_item.to_param, order_item: invalid_params[:order_item] }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested order item" do
      order_item = OrderItem.create! valid_params[:order_item]
      expect {
        delete :destroy, params: { id: order_item.to_param }
      }.to change(OrderItem, :count).by(-1)
    end

    it "redirects to the order items list" do
      order_item = OrderItem.create! valid_params[:order_item]
      delete :destroy, params: { id: order_item.to_param }
      expect(response).to redirect_to(order_items_url)
    end
  end
end
