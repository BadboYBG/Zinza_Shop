Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "/contact", to: "pages#contact"
  get "/products/search", to: "products#search"
  get "/user", to: "orders#show"
  get "/mylist", to: "products#mylist"

  devise_for :users, controllers:{ registrantions: "registrantions"}
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  scope "(:locale)", locale: /en|vi/ do
    resources :products, concerns: :paginatable
    resources :pages
    resources :categories
    resources :carts
    resources :orders
    root 'pages#index'
  end
end
