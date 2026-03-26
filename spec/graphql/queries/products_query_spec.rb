# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products Query', type: :graphql do
  let(:query) do
    <<~GQL
      query {
        products {
          id
          name
          description
          price
          stock
        }
      }
    GQL
  end

  describe 'products query' do
    it 'returns all products' do
      create(:product, name: 'Wireless Headphones', price: 149.99, stock: 50)
      create(:product, name: 'Mechanical Keyboard', price: 89.99, stock: 30)
      result = BackendSchema.execute(query)
      expect(result.dig('data', 'products')).to match_array([
        { 'id' => be_a(String), 'name' => 'Wireless Headphones', 'description' => be_a(String), 'price' => 149.99, 'stock' => 50 },
        { 'id' => be_a(String), 'name' => 'Mechanical Keyboard', 'description' => be_a(String), 'price' => 89.99, 'stock' => 30 }
      ])
    end
    
    it 'returns empty array when no products exist' do
      result = BackendSchema.execute(query)
      expect(result.dig('data', 'products')).to eq([])
    end
  end
end