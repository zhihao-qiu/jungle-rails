require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    let(:category) { Category.create(name: 'FakeCategory') }
    let(:name) { 'FakeProduct' }
    let(:price_cents) { 10000 }
    let(:quantity) { 1 }

    it 'can save successfully with all four fields set' do
      product = Product.new(name: name, price_cents: price_cents, category_id: category.id, quantity: quantity)
      expect(product).to be_valid
    end

    it 'is invalid without a name' do
      product = Product.new(name: nil, price_cents: price_cents, category_id: category.id, quantity: quantity)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is invalid without a price' do
      product = Product.new(name: name, price_cents: nil, category_id: category.id, quantity: quantity)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is invalid without a quantity' do
      product = Product.new(name: name, price_cents: price_cents, category_id: category.id, quantity: nil)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is invalid without a category' do
      product = Product.new(name: name, price_cents: price_cents, category_id: nil, quantity: quantity)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end