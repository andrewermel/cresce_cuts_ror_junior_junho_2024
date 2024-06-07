require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let!(:item) { Item.create!(name: "Test Item", description: "Test Description", price: 10.0, stock_quantity: 100) }
  let!(:item_params) { { name: "Updated Item", description: "Updated Description", price: 20.0, stock_quantity: 200 } }

  describe "GET index" do
    it "assigns all items as @items" do
      get :index
      expect(assigns(:items)).to eq([item])
    end
  end

  describe "GET show" do
    it "assigns the requested item as @item" do
      get :show, params: { id: item.to_param }
      expect(assigns(:item)).to eq(item)
    end
  end

  describe "GET new" do
    it "assigns a new item as @item" do
      get :new
      expect(assigns(:item)).to be_a_new(Item)
    end
  end

  describe "GET edit" do
    it "assigns the requested item as @item" do
      get :edit, params: { id: item.to_param }
      expect(assigns(:item)).to eq(item)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Item" do
        expect {
          post :create, params: { item: item_params }
        }.to change(Item, :count).by(1)
      end

      it "assigns a newly created item as @item" do
        post :create, params: { item: item_params }
        expect(assigns(:item)).to be_a(Item)
        expect(assigns(:item)).to be_persisted
      end

      it "redirects to the created item" do
        post :create, params: { item: item_params }
        expect(response).to redirect_to(Item.last)
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do
      it "updates the requested item" do
        put :update, params: { id: item.to_param, item: item_params }
        item.reload
        expect(item.name).to eq("Updated Item")
        expect(item.description).to eq("Updated Description")
        expect(item.price).to eq(20.0)
        expect(item.stock_quantity).to eq(200)
      end

      it "assigns the requested item as @item" do
        put :update, params: { id: item.to_param, item: item_params }
        expect(assigns(:item)).to eq(item)
      end

      it "redirects to the item" do
        put :update, params: { id: item.to_param, item: item_params }
        expect(response).to redirect_to(item)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested item" do
      expect {
        delete :destroy, params: { id: item.to_param }
      }.to change(Item, :count).by(-1)
    end

    it "redirects to the items list" do
      delete :destroy, params: { id: item.to_param }
      expect(response).to redirect_to(items_url)
    end
  end
end
