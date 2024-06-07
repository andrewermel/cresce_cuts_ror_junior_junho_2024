require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  let(:order) {
    Order.create!(
      total: "9.99",
      status: "MyString",
      customer: nil,
      store: nil
    )
  }

  before(:each) do
    assign(:order, order)
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(order), "post" do

      assert_select "input[name=?]", "order[total]"

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[customer_id]"

      assert_select "input[name=?]", "order[store_id]"
    end
  end
end
