# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :delete_product, mutation: Mutations::DeleteProduct
    field :update_product, mutation: Mutations::UpdateProduct
    field :create_product, mutation: Mutations::CreateProduct
    field :add_to_cart, mutation: Mutations::AddToCart
    field :update_cart_item, mutation: Mutations::UpdateCartItem
    field :remove_from_cart, mutation: Mutations::RemoveFromCart
    field :clear_cart, mutation: Mutations::ClearCart
  end
end
