# Nikyaa Store - Backend

A Rails GraphQL API for e-commerce functionality.

## Features

- **GraphQL API** - Flexible queries and mutations
- **Product Management** - CRUD operations via GraphQL
- **Shopping Cart** - Add, update, remove items, clear cart
- **CORS Support** - Enabled for frontend development

## Tech Stack

- Ruby on Rails 6.1
- GraphQL (graphql-ruby)
- SQLite (development)
- RSpec (testing)

## Getting Started

### Prerequisites

- Ruby 3.2+
- Bundler

### Installation

```bash
cd backend
bundle install
```

### Database Setup

```bash
rails db:create db:migrate db:seed
```

### Run Seeds (sample products)

```bash
rails db:seed
```

### Development Server

```bash
rails server
```

Opens at http://localhost:3000

### GraphQL Endpoint

- URL: `http://localhost:3000/graphql`
- POST requests only

### GraphiQL (Development)

Browse the API at http://localhost:3000/graphiql

## GraphQL API Reference

### Queries

```graphql
# Get all products
query {
  products {
    id
    name
    description
    price
    stock
    createdAt
    updatedAt
  }
}

# Get single product
query {
  product(id: "1") {
    id
    name
    description
    price
    stock
  }
}

# Get cart
query {
  cart {
    id
    total
    cartItems {
      id
      quantity
      subtotal
      product {
        id
        name
        price
      }
    }
  }
}
```

### Mutations

```graphql
# Add to cart
mutation {
  addToCart(productId: "1") {
    cartItem {
      id
      quantity
      subtotal
    }
  }
}

# Update cart item quantity
mutation {
  updateCartItem(id: "1", quantity: 3) {
    cartItem {
      id
      quantity
      subtotal
    }
  }
}

# Remove from cart
mutation {
  removeFromCart(id: "1") {
    success
  }
}

# Clear cart
mutation {
  clearCart {
    success
  }
}
```

## Running Tests

```bash
bundle exec rspec
```

## Project Structure

```
app/
├── graphql/
│   ├── types/
│   │   ├── product_type.rb
│   │   ├── cart_type.rb
│   │   ├── cart_item_type.rb
│   │   ├── query_type.rb
│   │   └── mutation_type.rb
│   └── mutations/
│       ├── add_to_cart.rb
│       ├── update_cart_item.rb
│       ├── remove_from_cart.rb
│       └── clear_cart.rb
└── models/
    ├── product.rb
    ├── cart.rb
    └── cart_item.rb
```

## Models

- **Product** - id, name, description, price, stock
- **Cart** - id, has many cart_items
- **CartItem** - id, cart_id, product_id, quantity
