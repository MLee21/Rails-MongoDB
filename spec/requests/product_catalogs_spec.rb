require 'rails_helper'

RSpec.describe "ProductCatalogs", type: :request do
  describe "GET /product_catalogs" do
    it "works! (now write some real specs)" do
      get product_catalogs_path
      expect(response).to have_http_status(200)
    end
  end
end
