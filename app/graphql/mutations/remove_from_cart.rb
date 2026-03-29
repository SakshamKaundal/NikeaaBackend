# frozen_string_literal: true

module Mutations
  class RemoveFromCart < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: true

    def resolve(id:)
      cart_item = CartItem.find(id)
      cart_item.destroy
      { success: true }
    end
  end
end
