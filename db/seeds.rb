until Product.count >= 10
  product = Product.create(image_url: "http://placekitten.com/40#{rand(10)}/40#{rand(10)}", name: Faker::Commerce.product_name, description: Faker::Lorem.paragraph(2))
  product.product_options.create(name: Faker::Commerce.color, price_in_cents: (rand(100) + 5) * 100)
end
