# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      product = build(:product)
      expect(product).to be_valid
    end

    it 'requires a name' do
      product = build(:product, name: nil)
      expect(product).not_to be_valid
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'requires a price' do
      product = build(:product, price: nil)
      expect(product).not_to be_valid
      expect(product.errors[:price]).to include("can't be blank")
    end

    it 'requires stock to be zero or greater' do
      product = build(:product, stock: -1)
      expect(product).not_to be_valid
      expect(product.errors[:stock]).to include("must be greater than or equal to 0")
    end
  end
end
