require 'rails_helper'

RSpec.describe Store, type: :model do
  it "is valid with valid attributes" do
    store = Store.new(name: "Example Store", description: "A store description", address: "123 Main St")
    expect(store).to be_valid
  end

  it "is not valid without a name" do
    store = Store.new(description: "A store description", address: "123 Main St")
    expect(store).not_to be_valid
  end

  it "is not valid without an address" do
    store = Store.new(name: "Example Store", description: "A store description")
    expect(store).not_to be_valid
  end
end
