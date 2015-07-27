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
end