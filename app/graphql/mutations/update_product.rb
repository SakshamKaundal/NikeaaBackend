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
      product.update(name: name, price: price, stock: stock)
      { product: product }
    end
    
  end
end
