# frozen_string_literal: true

module Mutations
  class ClearCart < BaseMutation
    field :success, Boolean, null: true

    def resolve
      cart = Cart.first
      cart&.cart_items.destroy_all
      { success: true }
    end
  end
end
