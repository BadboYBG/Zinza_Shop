Category.create(name: 'Men')
Category.create(name: 'Women')
Category.create(name: 'Shoes')
Category.create(name: 'Bag')
Category.create(name: 'Scarf')

99.times do |n|
  image = Faker::Number.between(10, 16)
  Product.create!(
    name: "Product #{n}",
    price: n * 1000,
    sale: 2,
    number: 12,
    image: "product-#{image}.jpg",
    category_id: Faker::Number.between(1, 5),
    detail: 'Details Product'
  )
end
