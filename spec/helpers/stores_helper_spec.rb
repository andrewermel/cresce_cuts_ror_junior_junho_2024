# spec/helpers/stores_helper_spec.rb

require 'rails_helper'

RSpec.describe StoresHelper, type: :helper do
  describe "#format_store_address" do
    it "formats the store address" do
      store = FactoryBot.create(:store, address: "123 Main St")
      expect(helper.format_store_address(store)).to eq("Address: 123 Main St")
    end
  end

  describe "#store_description_snippet" do
    it "truncates store description" do
      store = FactoryBot.create(:store, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
      expect(helper.store_description_snippet(store)).to eq("Lorem ipsum dolor sit amet, consectetur...")
    end
  end
end
