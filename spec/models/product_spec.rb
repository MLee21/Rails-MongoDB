require 'rails_helper'

RSpec.describe Product, type: :model do
  it "has valid attributes" do 
    product = Product.create(name: "Nexus", price: 600)
    expect(product).to be_valid
  end
end
