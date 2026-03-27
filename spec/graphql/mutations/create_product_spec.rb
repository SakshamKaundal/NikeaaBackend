# frozen_string_literal: true
require 'rails_helper'
RSpec.describe Mutations::CreateProduct, type: :graphql do
  it 'creates a product with valid data' do
    result = BackendSchema.execute(
      <<~GQL
        mutation {
          createProduct(input: { name: "Test Product", price: 99.99, stock: 10 }) {
            product { id name price stock }
          }
        }
      GQL
    )
    expect(result.dig('data', 'createProduct', 'product')['name']).to eq('Test Product')
  end

  it 'returns an error when the product is not valid' do
    result = BackendSchema.execute(
      <<~GQL
        mutation {
          createProduct(input: { name: "", price: 99.99, stock: 10 }) {
            product { id name price stock }
          }
        }
      GQL
    )
    expect(result.dig('data', 'createProduct', 'product')).to be_nil
    expect(result['errors'].map { |e| e['message'] }).to include("Name can't be blank")
  end
end