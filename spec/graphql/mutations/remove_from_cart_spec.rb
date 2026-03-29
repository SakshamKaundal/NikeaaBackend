# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::RemoveFromCart, type: :graphql do
  let(:cart_item) { create(:cart_item) }

  it 'removes item from cart' do
    cart_item_id = cart_item.id

    result = BackendSchema.execute(
      <<~GQL
        mutation {
          removeFromCart(input: { id: "#{cart_item_id}" }) {
            success
          }
        }
      GQL
    )
    expect(result.dig('data', 'removeFromCart', 'success')).to eq(true)
    expect(CartItem.find_by(id: cart_item_id)).to be_nil
  end
end
