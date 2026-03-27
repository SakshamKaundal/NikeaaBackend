# frozen_string_literal: true

module Mutations
  class DeleteProduct < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: true

    def resolve(id:)
      product = Product.find(id)
      product.destroy
      { success: true }
    rescue ActiveRecord::RecordNotFound
      raise GraphQL::ExecutionError, 'Product not found'
    end
  end
end
