require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:valid_attributes) { { name: "Example Item", description: "Lorem ipsum dolor sit amet", price: 10.0, stock_quantity: 100 } }
  let(:invalid_attributes) { { name: "", description: "Lorem ipsum dolor sit amet", price: 10.0, stock_quantity: 100 } }

  describe "GET #index" do
    it "renders a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "renders a successful response" do
      item = Item.create!(valid_attributes)
      get :show, params: { id: item.id }
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "renders a successful response" do
      item = Item.create!(valid_attributes)
      get :edit, params: { id: item.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Item" do
        expect {
          post :create, params: { item: valid_attributes }
        }.to change(Item, :count).by(1)
      end

      it "redirects to the created item" do
        post :create, params: { item: valid_attributes }
        expect(response).to redirect_to(Item.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Item" do
        expect {
          post :create, params: { item: invalid_attributes }
        }.to change(Item, :count).by(0)
      end

      it "renders a response with 422 status" do
        post :create, params: { item: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH #update" do
    let(:new_attributes) { { name: "New Item Name" } }

    context "with valid parameters" do
      it "updates the requested item" do
        item = Item.create!(valid_attributes)
        patch :update, params: { id: item.id, item: new_attributes }
        item.reload
        expect(item.name).to eq("New Item Name")
      end

      it "redirects to the item" do
        item = Item.create!(valid_attributes)
        patch :update, params: { id: item.id, item: valid_attributes }
        expect(response).to redirect_to(item)
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status" do
        item = Item.create!(valid_attributes)
        patch :update, params: { id: item.id, item: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested item" do
      item = Item.create!(valid_attributes)
      expect {
        delete :destroy, params: { id: item.id }
      }.to change(Item, :count).by(-1)
    end

    it "redirects to the items list" do
      item = Item.create!(valid_attributes)
      delete :destroy, params: { id: item.id }
      expect(response).to redirect_to(items_url)
    end
  end
end
