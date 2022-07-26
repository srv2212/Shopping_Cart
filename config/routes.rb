Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "carts#index"
  get "carts/:id", to: "carts#show"
  delete "carts/items/:id", to: "items#destroy"
  patch "carts/items/:id", to: "items#update"
  delete "carts/:id", to: "carts#destroy"
  # Defines the root path route ("/")
  # root "articles#index"
end
