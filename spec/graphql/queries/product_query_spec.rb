# frozen_string_literal: true
require 'rails_helper'
RSpec.describe 'Product Query', type: :graphql do
  let(:query) do
    <<~GQL
      query($id: ID!) {
        product(id: $id) {
          id
          name
          description
          price
          stock
        }
      }
    GQL
  end
  describe 'product query' do
    it 'returns a product by id' do
      product = create(:product, name: 'Wireless Headphones', price: 149.99, stock: 50)
      result = BackendSchema.execute(query, variables: { id: product.id })
      expect(result.dig('data', 'product')).to include(
        'name' => 'Wireless Headphones',
        'price' => 149.99,
        'stock' => 50
      )
    end
    
    it 'returns nil when product not found' do
      result = BackendSchema.execute(query, variables: { id: 99999 })
      expect(result.dig('data', 'product')).to be_nil
      expect(result.dig('errors', 0, 'message')).to include('not found')
    end
  end
end