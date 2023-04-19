Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, sign_out_via: [:get, :post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 post 'authenticate', to: 'authentication#authenticate'
 resources :foods 
  resources :users, only: [:index]
  resources :recipes, only: [:index, :new, :show, :destroy, :create] do
    resources :recipe_foods
  end

    get '/general_shopping_list', to: 'foods#general'
  get '/public_recipes', to: 'public_recipes#index'

  root to: "foods#index"
end
