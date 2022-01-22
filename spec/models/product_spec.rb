require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'should create a product with the four fields specified' do
      @category = Category.create(name: 'Blankets')
      @product = @category.products.create(name: 'fluffy', price: 7.99, quantity: 10)
      @product.errors.full_messages
      expect(@product).to be_present
    end

    it 'should not create a product because of nil name' do
      @category = Category.create(name: 'Food')
      @product = @category.products.create(name: nil, price: 3.99, quantity: 100)
      # puts @product.errors.full_messages
      expect(@product.errors.full_messages.length).to be_truthy
      expect(@product.id).to be_nil
    end

    it 'should not create a product because of nil price' do
      @category = Category.create(name: 'Plants')
      @product = @category.products.create(name: 'pickes', price: nil, quantity: 50)
      # p @product.errors.full_messages
      expect(@product.errors.full_messages.length).to be_truthy
      expect(@product.id).to be_nil
    end

    it 'should not create a product because of nil quantity' do
      @category = Category.create(name: 'Vegetables')
      @product = @category.products.create(name: 'Tomatoes', price: 6.99, quantity: nil)
      # puts @product.errors.full_messages
      expect(@product.errors.full_messages.length).to be_truthy
      expect(@product.id).to be_nil
    end

    it 'should not create a product because of nil category' do
      # @category = Category.create(name: nil)
      @product = Product.create(name: 'Charazard', price: 99.99, quantity: 1)
      # puts @product.errors.full_messages
      expect(@product.errors.full_messages.length).to be_truthy
      expect(@product.id).to be_nil
    end
  end
end
