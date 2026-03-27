# frozen_string_literal: true

module Mutations
  class CreateProduct < BaseMutation
    argument :name, String, required: true
    argument :price, Float, required: true
    argument :stock, Integer, required: true

    field :product, Types::ProductType, null: true

    def resolve(name:, price:, stock:)
      product = Product.new(name: name, price: price, stock: stock)
      if product.save
        { product: product }
      else
        product.errors.full_messages.each do |message|
          raise GraphQL::ExecutionError, message
        end
        { product: nil }
      end
    end
  end
end