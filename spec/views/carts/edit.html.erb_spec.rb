require 'rails_helper'

RSpec.describe "carts/edit", type: :view do
  let(:cart) {
    Cart.create!(
      customer: nil
    )
  }

  before(:each) do
    assign(:cart, cart)
  end

  it "renders the edit cart form" do
    render

    assert_select "form[action=?][method=?]", cart_path(cart), "post" do

      assert_select "input[name=?]", "cart[customer_id]"
    end
  end
end
