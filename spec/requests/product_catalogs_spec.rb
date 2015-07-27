require 'rails_helper'

RSpec.describe "ProductCatalogs", type: :request do
  let!(:product){Product.create(name: "Nexus 5", price: 600)}

  describe "GET /product_catalogs" do
    it "displays some products list" do
      visit products_path
      expect(page).to have_content("Nexus 5")
    end
  end
end
