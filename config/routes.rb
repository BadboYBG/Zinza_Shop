Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: :rails_admin
  get "/contact", to: "pages#contact"
  get "/products/search", to: "products#search"
  get "/user", to: "orders#show"

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
