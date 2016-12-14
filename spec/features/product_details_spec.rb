require 'rails_helper'

RSpec.feature "Visitor navigates to a product page", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click on a product and load the products page" do
    visit root_path
    within(page.first(".actions")) do
      click_link("Details")
    end

    # sleep(5)
    # save_screenshot

    # Since we selected the FIRST product on the page, and the products render first to last
    # we therefore search for the last product render (first product found)
    expect(current_path).to eq(product_path(10))
    expect(page).to have_css('.products-show')
  end
end
