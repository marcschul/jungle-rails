require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

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

  scenario "Vists home page -> clicks Add to Cart button -> My Cart displays (1)" do
    #ACT
    visit root_path
    first("button.btn-primary", match: :first).click
    sleep 5
    puts page.html
    
    #DEBUG
    save_screenshot

    #VERIFY
    expect(page).to have_content("My Cart (1)")
  end

end
