# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::AddToCart, type: :graphql do
  let(:product) { create(:product) }

  it 'adds product to cart' do
    result = BackendSchema.execute(
      <<~GQL
        mutation {
          addToCart(input: { productId: "#{product.id}" }) {
            cartItem {
              id
              product { id name }
              quantity
            }
          }
        }
      GQL
    )
    expect(result.dig('data', 'addToCart', 'cartItem', 'product', 'id')).to eq(product.id.to_s)
    expect(result.dig('data', 'addToCart', 'cartItem', 'quantity')).to eq(1)
  end

  it 'increases quantity if product already in cart' do
    cart = create(:cart)
    cart_item = create(:cart_item, cart: cart, product: product, quantity: 1)

    result = BackendSchema.execute(
      <<~GQL
        mutation {
          addToCart(input: { productId: "#{product.id}" }) {
            cartItem {
              id
              quantity
            }
          }
        }
      GQL
    )
    expect(result.dig('data', 'addToCart', 'cartItem', 'quantity')).to eq(2)
  end
end
