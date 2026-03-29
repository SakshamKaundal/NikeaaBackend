# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::UpdateCartItem, type: :graphql do
  let(:cart_item) { create(:cart_item, quantity: 2) }

  it 'updates cart item quantity' do
    result = BackendSchema.execute(
      <<~GQL
        mutation {
          updateCartItem(input: { id: "#{cart_item.id}", quantity: 5 }) {
            cartItem {
              id
              quantity
            }
          }
        }
      GQL
    )
    expect(result.dig('data', 'updateCartItem', 'cartItem', 'quantity')).to eq(5)
  end
end
