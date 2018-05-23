Rails.application.routes.draw do

  root 'pages#index'
  get "/contact", to: "pages#contact"
  get "/products/search", to: "products#search"
  get "/user", to: "orders#show"
  resources :pages
  resources :categories
  resources :carts
  resources :orders

  devise_for :users, controllers:{ registrantions: "registrantions"}
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :products, concerns: :paginatable
end
