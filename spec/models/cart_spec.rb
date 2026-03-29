# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { create(:cart) }
  let(:product) { create(:product) }

  it 'has many cart items' do
    cart_item = create(:cart_item, cart: cart, product: product)
    expect(cart.cart_items).to include(cart_item)
  end

  it 'has many products through cart items' do
    cart_item = create(:cart_item, cart: cart, product: product)
    expect(cart.products).to include(product)
  end

  it 'calculates total correctly' do
    product1 = create(:product, price: 10.00)
    product2 = create(:product, price: 20.00)
    create(:cart_item, cart: cart, product: product1, quantity: 2)
    create(:cart_item, cart: cart, product: product2, quantity: 1)
    expect(cart.total).to eq(40.00)
  end
end
