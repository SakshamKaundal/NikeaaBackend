# frozen_string_literal: true

module Mutations
  class AddToCart < BaseMutation
    argument :product_id, ID, required: true

    field :cart_item, Types::CartItemType, null: true

    def resolve(product_id:)
      cart = Cart.first_or_create!
      cart_item = cart.cart_items.find_or_initialize_by(product_id: product_id)
      if cart_item.new_record?
        cart_item.quantity = 1
      else
        cart_item.quantity += 1
      end
      cart_item.save!
      { cart_item: cart_item }
    end
  end
end
