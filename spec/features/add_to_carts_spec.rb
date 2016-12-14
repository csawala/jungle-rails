require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "They add a product to the cart" do
    visit root_path

    within(page.first(".actions")) do
      click_link("Add")
    end

    # click_link("My Cart")

    # sleep(5)
    # save_screenshot

    expect(page).to have_content("My Cart (1)")
  end
end
