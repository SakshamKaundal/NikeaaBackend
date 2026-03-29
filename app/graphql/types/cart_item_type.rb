# frozen_string_literal: true

module Types
  class CartItemType < Types::BaseObject
    field :id, ID, null: false
    field :product, Types::ProductType, null: false
    field :quantity, Integer, null: false
    field :subtotal, Float, null: false
  end
end
