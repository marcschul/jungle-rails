require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'four_fields' do
      @category = Category.create!(name: 'Blankets')
      @product = @category.products.create!(name: 'fluffy', price: 7.99, quantity: 10)
      @product.errors.full_messages
      expect(@product).to be_present
    end

    it 'name' do
      @category = Category.create!(name: 'Food')
      @product = @category.products.create!(name: nil, price: 3.99, quantity: 100)
      @product.errors.full_messages
      expect(@product.name).to be_present
    end

    it 'price' do
      @category = Category.create!(name: 'Plants')
      @product = @category.products.create!(name: 'pickes', price: nil, quantity: 50)
      @product.errors.full_messages
      expect(@product.price).to be_present
    end

    it 'quantity' do
      @category = Category.create!(name: 'Vegetables')
      @product = @category.products.create!(name: 'Tomatoes', price: 6.99, quantity: nil)
      @product.errors.full_messages
      expect(@product.quantity).to be_present
    end

    it 'category' do
      @category = Category.create!(name: nil)
      @product = @category.products.create!(name: 'Charazard', price: 99.99, quantity: 1)
      @product.errors.full_messages
      expect(@product.category).to be_present
    end
  end
end
