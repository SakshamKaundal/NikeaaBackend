# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { "Test Product" }
    description { "A test product description" }
    price { 99.99 }
    stock { 10 }
  end
end
