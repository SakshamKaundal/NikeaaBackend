# frozen_string_literal: true

Product.destroy_all

Product.create!(
  name: "Wireless Headphones",
  description: "High-quality Bluetooth headphones with noise cancellation",
  price: 149.99,
  stock: 50
)

Product.create!(
  name: "Mechanical Keyboard",
  description: "RGB backlit mechanical keyboard with Cherry MX switches",
  price: 89.99,
  stock: 30
)

Product.create!(
  name: "USB-C Hub",
  description: "7-in-1 USB-C hub with HDMI, USB 3.0, and SD card reader",
  price: 45.00,
  stock: 100
)

puts "Created #{Product.count} products"
