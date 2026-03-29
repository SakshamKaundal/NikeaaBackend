# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart) { create(:cart) }
  let(:product) { create(:product) }

  it 'belongs to cart' do
    cart_item = create(:cart_item, cart: cart)
    expect(cart_item.cart).to eq(cart)
  end

  it 'belongs to product' do
    cart_item = create(:cart_item, product: product)
    expect(cart_item.product).to eq(product)
  end

  it 'has default quantity of 1' do
    cart_item = create(:cart_item, cart: cart, product: product)
    expect(cart_item.quantity).to eq(1)
  end

  it 'calculates subtotal' do
    cart_item = create(:cart_item, cart: cart, product: product, quantity: 3)
    expect(cart_item.subtotal).to eq(product.price * 3)
  end
end
