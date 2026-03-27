# frozen_string_literal: true

module Mutations
  class UpdateProduct < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :price, Float, required: true
    argument :stock, Integer, required: true

    field :product, Types::ProductType, null: true

    def resolve(id:, name:, price:, stock:)
      product = Product.find(id)
      if product.update(name: name, price: price, stock: stock)
        { product: product }
      else
        product.errors.full_messages.each do |message|
          raise GraphQL::ExecutionError, message
        end
      end
    rescue ActiveRecord::RecordNotFound
      raise GraphQL::ExecutionError, 'Product not found'
    end
  end
end
