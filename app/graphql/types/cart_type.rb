# frozen_string_literal: true

module Types
  class CartType < Types::BaseObject
    field :id, ID, null: false
    field :cart_items, [Types::CartItemType], null: false
    field :total, Float, null: false
  end
end
