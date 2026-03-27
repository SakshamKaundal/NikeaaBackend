# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Mutations::UpdateProduct, type: :graphql do
  let(:product) { create(:product) }
  it 'updates a product with valid data' do
    result = BackendSchema.execute(
      <<~GQL
        mutation {
          updateProduct(input: { id: "#{product.id}", name: "Updated Name", price: 149.99, stock: 25 }) {
            product { id name price stock }
          }
        }
      GQL
    )
    expect(result.dig('data', 'updateProduct', 'product')['name']).to eq('Updated Name')
  end

  it 'returns an error when the product is not found' do
    result = BackendSchema.execute(
      <<~GQL
        mutation {
          updateProduct(input: { id: "99999", name: "Updated Name", price: 149.99, stock: 25 }) {
            product { id name price stock }
          }
        }
      GQL
    )
    expect(result.dig('data', 'updateProduct', 'product')).to be_nil
    expect(result.dig('errors', 0, 'message')).to include('Product not found')
  end
end