Rails.application.routes.draw do
  get 'public_recipes/index'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "foods#index"
  resources :foods, only: [:index, :show]
  resources :public_recipes, only: [:index]
end
