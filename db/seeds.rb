Category.create(name: 'Men')
Category.create(name: 'Women')
Category.create(name: 'Shoes')
Category.create(name: 'Bag')
Category.create(name: 'Scarf')

user =User.new(email: 'minhnv0110@gmail.com', password: 'van.minh', password_confirmation: 'van.minh', name: "Minh [BG]", address: "BG", phone: "0975640110")
user.skip_confirmation!
user.save!
user =User.new(email: 'niemhyvongsailam.nvm@gmail.com', password: 'van.minh', password_confirmation: 'van.minh', name: "Minh [BG]", address: "BG", phone: "0975640110")
user.skip_confirmation!
user.save!

user =User.new(email: 'test@gmail.com', password: 'van.minh', password_confirmation: 'van.minh', name: "Minh [BG]", address: "BG", phone: "0975640110")
user.skip_confirmation!
user.save!

99.times do |n|
  Product.create!(
    name: "Product #{n}",
    price: n * 1000,
    sale: 2,
    number: 12,
    image: 'minh.jpg',
    category_id: Faker::Number.between(1, 5),
    user_id: 1,
    view: Faker::Number.between(100, 1000),
    detail: Faker::ChuckNorris.fact
  )
end

AdminUser.create!(email: 'admin@gmail.com', password: '123456', password_confirmation: '123456')
