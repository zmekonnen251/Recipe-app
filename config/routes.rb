Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
<<<<<<< HEAD
  # root to: "home#index"

  resources :foods, only: [:index, :create, :new, :destroy]
=======
  root to: "welcome#index"
>>>>>>> 8b2497e (add welcome page)
end
