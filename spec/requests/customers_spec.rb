require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  let(:valid_attributes) { { name: "John Doe", email: "john@example.com", address: "123 Main St" } }

  describe "GET #index" do
    it "renders a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "renders a successful response" do
      customer = Customer.create!(valid_attributes)
      get :show, params: { id: customer.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "renders a successful response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "renders a successful response" do
      customer = Customer.create!(valid_attributes)
      get :edit, params: { id: customer.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Customer" do
        expect {
          post :create, params: { customer: valid_attributes }
        }.to change(Customer, :count).by(1)
      end

      it "redirects to the created customer" do
        post :create, params: { customer: valid_attributes }
        expect(response).to redirect_to(Customer.last)
      end
    end
  end

  describe "PATCH #update" do
    let(:new_attributes) { { name: "New Name" } }

    context "with valid params" do
      it "updates the requested customer" do
        customer = Customer.create!(valid_attributes)
        patch :update, params: { id: customer.id, customer: new_attributes }
        customer.reload
        expect(customer.name).to eq("New Name")
      end

      it "redirects to the customer" do
        customer = Customer.create!(valid_attributes)
        patch :update, params: { id: customer.id, customer: valid_attributes }
        expect(response).to redirect_to(customer)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested customer" do
      customer = Customer.create!(valid_attributes)
      expect {
        delete :destroy, params: { id: customer.id }
      }.to change(Customer, :count).by(-1)
    end

    it "redirects to the customers list" do
      customer = Customer.create!(valid_attributes)
      delete :destroy, params: { id: customer.id }
      expect(response).to redirect_to(customers_url)
    end
  end
end
