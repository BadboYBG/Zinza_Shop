Fabricator(:product) do
  name { Faker::Name.name }
  price 4
  sale 5
  number 4
  image { File.open Rails.root.join 'spec', 'support', 'sample_images', 'product-01.jpg' }
  detail 'My text'
end
