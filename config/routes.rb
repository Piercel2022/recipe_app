Rails.application.routes.draw do
  get '/public_recipes', to: 'public_recipes#index'
  get '/shopping_lists', to: 'shopping_lists#index'
  resources :recipe_foods
  resources :recipes
  resources :foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  # Defines the root path route ("/")
  root "foods#index"
end
