Rails.application.routes.draw do
  devise_for :users

  resources :recipes,only: %i[index show new create edit update ] do
    resources :recipe_foods, only: %i[new create destroy edit update]
  end

  resources :foods, only: [:index, :create, :new, :destroy]
  resources :public_recipes, only: [:index]
  
  delete 'recipes/:id', to: 'recipes#destroy' , as: :recipe_destroy
  put 'recipes/:id', to: 'recipes#update' , as: :recipe_update
  
  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  
  root "public_recipes#index"
end
