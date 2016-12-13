require 'rails_helper'

RSpec.feature "Visitor navigates to a product page", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
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
    within(".actions") do
      click_link("Details")
    end

    sleep(5)
    save_screenshot

    expect(page).to have_css('.products-show')
  end
end
