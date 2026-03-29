# frozen_string_literal: true

module Mutations
  class UpdateCartItem < BaseMutation
    argument :id, ID, required: true
    argument :quantity, Integer, required: true

    field :cart_item, Types::CartItemType, null: true

    def resolve(id:, quantity:)
      cart_item = CartItem.find(id)
      cart_item.update!(quantity: quantity)
      { cart_item: cart_item }
    end
  end
end
