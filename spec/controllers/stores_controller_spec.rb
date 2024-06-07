require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  let!(:store) { create(:store) }
  let(:valid_attributes) { { name: "New Store", description: "New store description", address: "456 Another St" } }
  let(:invalid_attributes) { { name: nil, description: nil, address: nil } }

  describe "GET #index" do
    it "assigns all stores as @stores" do
      get :index
      expect(assigns(:stores)).to eq([store])
    end
  end

  describe "GET #show" do
    it "assigns the requested store as @store" do
      get :show, params: { id: store.to_param }
      expect(assigns(:store)).to eq(store)
    end
  end

  describe "GET #new" do
    it "assigns a new store as @store" do
      get :new
      expect(assigns(:store)).to be_a_new(Store)
    end
  end

  describe "GET #edit" do
    it "assigns the requested store as @store" do
      get :edit, params: { id: store.to_param }
      expect(assigns(:store)).to eq(store)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Store" do
        expect {
          post :create, params: { store: valid_attributes }
        }.to change(Store, :count).by(1)
      end

      it "assigns a newly created store as @store" do
        post :create, params: { store: valid_attributes }
        expect(assigns(:store)).to be_a(Store)
        expect(assigns(:store)).to be_persisted
      end

      it "redirects to the created store" do
        post :create, params: { store: valid_attributes }
        expect(response).to redirect_to(Store.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved store as @store" do
        post :create, params: { store: invalid_attributes }
        expect(assigns(:store)).to be_a_new(Store)
      end

      it "re-renders the 'new' template" do
        post :create, params: { store: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { name: "Updated Store", description: "Updated description", address: "789 Updated St" } }

      it "updates the requested store" do
        put :update, params: { id: store.to_param, store: new_attributes }
        store.reload
        expect(store.name).to eq("Updated Store")
        expect(store.description).to eq("Updated description")
        expect(store.address).to eq("789 Updated St")
      end

      it "assigns the requested store as @store" do
        put :update, params: { id: store.to_param, store: valid_attributes }
        expect(assigns(:store)).to eq(store)
      end

      it "redirects to the store" do
        put :update, params: { id: store.to_param, store: valid_attributes }
        expect(response).to redirect_to(store)
      end
    end

    context "with invalid params" do
      it "assigns the store as @store" do
        put :update, params: { id: store.to_param, store: invalid_attributes }
        expect(assigns(:store)).to eq(store)
      end

      it "re-renders the 'edit' template" do
        put :update, params: { id: store.to_param, store: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested store" do
      expect {
        delete :destroy, params: { id: store.to_param }
      }.to change(Store, :count).by(-1)
    end

    it "redirects to the stores list" do
      delete :destroy, params: { id: store.to_param }
      expect(response).to redirect_to(stores_url)
    end
  end
end
