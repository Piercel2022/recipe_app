Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  devise_for :users
  # Defines the root path route ("/")
  root to: 'foods#index'
  resources :foods, only: [:index, :create, :new, :destroy]
  resources :recipes, only: [:index, :show, :create, :new, :destroy] do
    resources :recipe_foods, only: [:index, :edit, :update, :destroy, :create, :new]
  end
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]


  devise_scope :user do 
    authenticated :user do 
      root 'users#index', as: :authenticated_root 
    end
    unauthenticated do 
      root 'devise/sessions#new', as: :unauthenticated_root 
    end
  end
=======
=======
>>>>>>> 0444bd7 (Add workflow)
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
