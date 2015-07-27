require "rails_helper"

feature "a product" do 
  scenario "can be created" do
    visit products_path
    click_button 'New Product'
    expect(current_path).to eq(new_product_path)
    fill_in 'product[name]', with: 'Nexus 5'
    fill_in 'product[price]', with: '30000'
    click_button 'Save Product'
    expect(current_path).to eq(products_path)
  end

  scenario "can be viewed" do 
    product = Product.create(name: "Nexus 5", price: 600)
    visit product_path(product)
    expect(page).to have_content("Nexus 5")
    expect(page).to have_content(600)
  end
end