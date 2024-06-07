require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  let!(:customer) { Customer.create(name: "John Doe", email: "john@example.com", address: "123 Main St") }
  let!(:customer2) { Customer.create(name: "Nelson Doe", email: "j1ohn@example.com", address: "123 Main St") }

  describe "GET index" do
    it "assigns all customers as @customers" do
      get :index
      expect(assigns(:customers)).to eq([customer, customer2])
    end
  end

  describe "GET show" do
    it "assigns the requested customer as @customer" do
      get :show, params: { id: customer.to_param }
      expect(assigns(:customer)).to eq(customer)
    end
  end

  describe "GET new" do
    it "assigns a new customer as @customer" do
      get :new
      expect(assigns(:customer)).to be_a_new(Customer)
    end
  end

  describe "GET edit" do
    it "assigns the requested customer as @customer" do
      get :edit, params: { id: customer.to_param }
      expect(assigns(:customer)).to eq(customer)
    end
  end

  describe "POST create" do
    context "with valid params" do
      let(:valid_attributes) { { name: "Jane Doe", email: "jane@example.com", address: "456 Elm St" } }

      it "creates a new Customer" do
        expect {
          post :create, params: { customer: valid_attributes }
        }.to change(Customer, :count).by(1)
      end

      it "assigns a newly created customer as @customer" do
        post :create, params: { customer: valid_attributes }
        expect(assigns(:customer)).to be_a(Customer)
        expect(assigns(:customer)).to be_persisted
      end

      it "redirects to the created customer" do
        post :create, params: { customer: valid_attributes }
        expect(response).to redirect_to(Customer.last)
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do
      let(:new_attributes) { { name: "Updated Name" } }

      it "updates the requested customer" do
        put :update, params: { id: customer.to_param, customer: new_attributes }
        customer.reload
        expect(customer.name).to eq("Updated Name")
      end

      it "assigns the requested customer as @customer" do
        put :update, params: { id: customer.to_param, customer: new_attributes }
        expect(assigns(:customer)).to eq(customer)
      end

      it "redirects to the customer" do
        put :update, params: { id: customer.to_param, customer: new_attributes }
        expect(response).to redirect_to(customer)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested customer" do
      expect {
        delete :destroy, params: { id: customer.to_param }
      }.to change(Customer, :count).by(-1)
    end

    it "redirects to the customers list" do
      delete :destroy, params: { id: customer.to_param }
      expect(response).to redirect_to(customers_url)
    end
  end
end
