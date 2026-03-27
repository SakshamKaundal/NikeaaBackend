# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :delete_product, mutation: Mutations::DeleteProduct
    field :update_product, mutation: Mutations::UpdateProduct
    field :create_product, mutation: Mutations::CreateProduct
  end
end
