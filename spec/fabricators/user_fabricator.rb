Fabricator :user do
  name 'Minh'
  phone '0975640110'
  address 'BG'
  image 'product-01.jpg'
  email Faker::Internet.email
  password '123456'
  password_confirmation '123456'
  confirmed_at Time.zone.today
end
