Rails.application.routes.draw do
  devise_for :users

  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: "home#index"
  
  root "public_recipes#index"

  resources :foods, only: [:index, :create, :new, :destroy]
  resources :public_recipes, only: [:index]
end
