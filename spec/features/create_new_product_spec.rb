require "rails_helper"

feature "a product" do 
  before do
    @product = Product.create :name => 'Nexus 5', :price => 30000
  end

  after do
    Product.delete_all 
  end

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
    visit product_path(@product)
    expect(page).to have_content("Nexus 5")
    expect(page).to have_content(30000)
  end

  scenario "can be edited" do 
    visit products_path
    find("#product_#{@product.id}").click_link 'Edit'
    expect(current_path).to eq(edit_product_path(@product))
    expect(page).to have_selector("input[value='Nexus 5']")
    expect(page).to have_selector("input[value='30000']")    
    fill_in 'product[price]', with: 25000
    click_button 'Save Product'
    expect(page).to have_content(25000)
    expect(page).to have_content("Nexus 5")
    visit products_path
    expect(page).to_not have_content(30000)  
  end
end