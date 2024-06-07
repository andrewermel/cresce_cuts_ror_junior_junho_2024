require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      total: "9.99",
      status: "MyString",
      customer: nil,
      store: nil
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[total]"

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[customer_id]"

      assert_select "input[name=?]", "order[store_id]"
    end
  end
end
