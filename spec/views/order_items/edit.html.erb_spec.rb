require 'rails_helper'

RSpec.describe "order_items/edit", type: :view do
  let(:order_item) {
    OrderItem.create!(
      order: nil,
      item: nil,
      quantity: 1
    )
  }

  before(:each) do
    assign(:order_item, order_item)
  end

  it "renders the edit order_item form" do
    render

    assert_select "form[action=?][method=?]", order_item_path(order_item), "post" do

      assert_select "input[name=?]", "order_item[order_id]"

      assert_select "input[name=?]", "order_item[item_id]"

      assert_select "input[name=?]", "order_item[quantity]"
    end
  end
end
