# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::ClearCart, type: :graphql do
  let(:cart) { create(:cart) }
  let!(:cart_item) { create(:cart_item, cart: cart) }
  let!(:cart_item2) { create(:cart_item, cart: cart) }

  it 'clears all items from cart' do
    result = BackendSchema.execute(
      <<~GQL
        mutation {
          clearCart(input: {}) {
            success
          }
        }
      GQL
    )
    expect(result.dig('data', 'clearCart', 'success')).to eq(true)
    expect(cart.cart_items.count).to eq(0)
  end
end
