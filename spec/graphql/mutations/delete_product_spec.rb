# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Mutations::DeleteProduct, type: :graphql do
  let(:product) { create(:product) }
  it 'deletes a product' do
    result = BackendSchema.execute(
      <<~GQL
        mutation {
          deleteProduct(input: { id: "#{product.id}" }) {
            success
          }
        }
      GQL
    )
    expect(result.dig('data', 'deleteProduct', 'success')).to eq(true)
    expect(Product.find_by(id: product.id)).to be_nil
  end

  it 'returns an error when the product is not found' do
    result = BackendSchema.execute(
      <<~GQL
        mutation {
          deleteProduct(input: { id: "99999" }) {
            success
          }
        }
      GQL
    )
  end
end