Rails.application.routes.draw do
  devise_for :users
  resources :recipes,only: %i[index show new create edit update ] do
    resources :recipe_foods, only: %i[new create destroy edit update]
  end

  delete 'recipes/:id', to: 'recipes#destroy' , as: :recipe_destroy
  put 'recipes/:id', to: 'recipes#update' , as: :recipe_update
  # post 'recipes', to: 'recipes#create', as: :create_recipe

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: "home#index"

  resources :foods, only: [:index, :create, :new, :destroy]
  root to: "welcome#index"
end
