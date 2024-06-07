require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    assign(:customer, Customer.create!(
      name: "Name",
      email: "Email",
      address: "Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Address/)
  end
end
