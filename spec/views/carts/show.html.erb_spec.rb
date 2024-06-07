require 'rails_helper'

RSpec.describe "carts/show", type: :view do
  before(:each) do
    assign(:cart, Cart.create!(
      customer: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
